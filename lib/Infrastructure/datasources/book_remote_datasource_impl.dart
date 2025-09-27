import 'package:dio/dio.dart';
import 'package:free_books/Core/errors/app_service_exception.dart';
import 'package:free_books/Infrastructure/datasources/book_remote_datasource.dart';
import 'package:free_books/Infrastructure/models/book_model.dart';

class BookRemoteDatasourceImpl implements BookRemoteDataSource {
  final Dio dio;
  final String baseUrl;

  BookRemoteDatasourceImpl({required this.dio, required this.baseUrl});

  static const _booksPath = '/books';

  @override
  Future<List<BookModel>> fetchPopular({int page = 1}) async {
    return _getBooks(query: {'page': page, 'topic': 'poems'});
  }

  @override
  Future<List<BookModel>> fetchRecommended({int page = 1}) async {
    return _getBooks(query: {'page': page, 'topic': 'romance'});
  }

  @override
  Future<List<BookModel>> search({required String query, int page = 1}) async {
    return _getBooks(query: {'search': query, 'page': page});
  }

  Future<List<BookModel>> _getBooks({Map<String, dynamic>? query}) async {
    try {
      final res = await dio.get('$baseUrl$_booksPath', queryParameters: query);

      if (res.statusCode != 200 || res.data == null) {
        throw AppServiceException(
          'HTTP ${res.statusCode}: invalid response',
          statusCode: res.statusCode,
        );
      }

      final books = ApiResponseModel.fromJson(
        res.data as Map<String, dynamic>,
      ).results;
      return books;
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final msg = e.type == DioExceptionType.connectionTimeout
          ? 'Timeout network'
          : e.type == DioExceptionType.receiveTimeout
          ? 'Timeout Timeout receiving data'
          : e.type == DioExceptionType.badResponse
          ? 'Invalid HTTP response ($code)'
          : e.type == DioExceptionType.connectionError
          ? 'Network/Host Error'
          : 'Network error';
      throw AppServiceException(msg, statusCode: code, cause: e);
    } catch (e) {
      throw AppServiceException('Unexpected error parsing Gutendex', cause: e);
    }
  }
}
