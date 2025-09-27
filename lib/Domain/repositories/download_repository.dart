import 'package:free_books/Domain/value_objects/download_result.dart';

abstract class DownloadRepository {
  Future<DownloadResult> download({
    required Uri url,
    required String bookId,
    required BookFormat format,
    void Function(int received, int total)? onProgress,
  });
}
