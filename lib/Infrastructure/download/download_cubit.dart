import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:free_books/Domain/use_cases/download_book_usecase.dart';
import 'package:free_books/Domain/value_objects/download_result.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  final DownloadBookUseCase downloadBook;
  DownloadCubit({required this.downloadBook}) : super(const DownloadIdle());

  Future<void> download({
    required String url,
    required String bookId,
    required BookFormat chosen,
  }) async {
    if (state is DownloadInProgress) return;

    emit(const DownloadInProgress(0, 0));
    try {
      final result = await downloadBook(
        url: Uri.parse(url),
        bookId: bookId,
        format: chosen,
        onProgress: (received, total) =>
            emit(DownloadInProgress(received, total)),
      );

      emit(DownloadSuccess(File(result.localPath), result.format));
    } catch (e) {
      emit(DownloadFailure(e.toString()));
      emit(const DownloadIdle());
    }
  }

  void reset() => emit(const DownloadIdle());
}
