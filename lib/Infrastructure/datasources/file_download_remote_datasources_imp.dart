import 'package:dio/dio.dart';
import 'package:free_books/Core/errors/app_service_exception.dart';
import 'package:free_books/Infrastructure/datasources/file_download_remote_datasources.dart';

class FileDownloadRemoteDatasourcesImp implements FileDownloadRemoteDataSource {
  final Dio dio;
  FileDownloadRemoteDatasourcesImp(this.dio);

  @override
  Future<void> downloadToPath({
    required Uri url,
    required String path,
    void Function(int received, int total)? onProgress,
  }) async {
    try {
      await dio.download(
        url.toString(),
        path,
        onReceiveProgress: onProgress,
        options: Options(
          followRedirects: true,
          responseType: ResponseType.bytes,
          validateStatus: (s) => s != null && s >= 200 && s < 300,
        ),
      );
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final msg = e.type == DioExceptionType.connectionTimeout
          ? 'Connection timeout'
          : e.type == DioExceptionType.receiveTimeout
          ? 'Receive timeout'
          : e.type == DioExceptionType.sendTimeout
          ? 'Send timeout'
          : e.type == DioExceptionType.badResponse
          ? 'Invalid HTTP response ($code)'
          : e.type == DioExceptionType.connectionError
          ? 'Network/Host error'
          : e.type == DioExceptionType.cancel
          ? 'Download canceled'
          : 'Network error';
      throw AppServiceException(msg, statusCode: code, cause: e);
    } catch (e) {
      throw AppServiceException('Unexpected download error', cause: e);
    }
  }
}
