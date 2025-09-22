import 'dart:io';

import 'package:dio/dio.dart';
import 'package:free_books/models/download_result.dart';
import 'package:path_provider/path_provider.dart';

class GutenbergDownloader {
  final Dio _dio = Dio();

  Future<DownloadResult> downloadBest({
    required Map<String, String> formats,
    required String bookId,
    void Function(int received, int total)? onProgress,
  }) async {
    final candidates = <({String mime, BookFormat kind})>[
      (mime: 'application/epub+zip', kind: BookFormat.epub),
      (mime: 'application/octet-stream', kind: BookFormat.htmlZip),
      (mime: 'text/plain', kind: BookFormat.txt),
    ];

    String? url;
    BookFormat? chosen;

    for (final c in candidates) {
      final match = formats.keys.firstWhere(
        (k) => k.startsWith(c.mime),
        orElse: () => '',
      );
      if (match.isNotEmpty) {
        url = formats[match]!;
        chosen = c.kind;
        break;
      }
    }

    if (url == null || chosen == null) {
      throw Exception('There are no supported formats for download.');
    }

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
