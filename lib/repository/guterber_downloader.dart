import 'dart:io';

import 'package:dio/dio.dart';
import 'package:free_books/models/download_result.dart';
import 'package:path_provider/path_provider.dart';

class GutenbergDownloader {
  final Dio _dio = Dio();

  Future<DownloadResult> downloadBest({
    required String url,
    required String bookId,
    required BookFormat chosen,
    void Function(int received, int total)? onProgress,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final ext = switch (chosen) {
      BookFormat.epub => 'epub',
      BookFormat.htmlZip => 'zip',
      BookFormat.txt => 'txt',
    };
    final filePath = '${dir.path}/gutenberg_$bookId.$ext';

    await _dio.download(
      url,
      filePath,
      onReceiveProgress: onProgress,
      options: Options(responseType: ResponseType.bytes, followRedirects: true),
    );

    return DownloadResult(File(filePath), chosen);
  }
}
