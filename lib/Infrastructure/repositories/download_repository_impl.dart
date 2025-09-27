import 'dart:io';

import 'package:free_books/Domain/repositories/download_repository.dart';
import 'package:free_books/Domain/value_objects/download_result.dart';
import 'package:free_books/Infrastructure/datasources/file_download_remote_datasources.dart';
import 'package:path_provider/path_provider.dart';

class DownloadRepositoryImpl implements DownloadRepository {
  final FileDownloadRemoteDataSource remote;
  final Future<Directory> Function() _getDir;

  DownloadRepositoryImpl({
    required this.remote,
    Future<Directory> Function()? getDir,
  }) : _getDir = getDir ?? getApplicationDocumentsDirectory;

  @override
  Future<DownloadResult> download({
    required Uri url,
    required String bookId,
    required BookFormat format,
    void Function(int received, int total)? onProgress,
  }) async {
    final dir = await _getDir();
    final ext = switch (format) {
      BookFormat.epub => 'epub',
      BookFormat.htmlZip => 'zip',
      BookFormat.txt => 'txt',
    };
    final path = '${dir.path}/gutenberg_$bookId.$ext';

    await remote.downloadToPath(url: url, path: path, onProgress: onProgress);

    return DownloadResult(path, format);
  }
}
