import 'package:free_books/Domain/repositories/download_repository.dart';
import 'package:free_books/Domain/value_objects/download_result.dart';

class DownloadBookUseCase {
  final DownloadRepository repo;
  DownloadBookUseCase(this.repo);

  Future<DownloadResult> call({
    required Uri url,
    required String bookId,
    required BookFormat format,
    void Function(int received, int total)? onProgress,
  }) {
    return repo.download(
      url: url,
      bookId: bookId,
      format: format,
      onProgress: onProgress,
    );
  }
}
