import 'package:free_books/Infrastructure/book_local.dart';
import 'package:free_books/Infrastructure/datasources/book_local_datasource.dart';
import 'package:free_books/Infrastructure/models/book_model.dart';

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final Duration artificialDelay;

  BookLocalDataSourceImpl({
    this.artificialDelay = const Duration(milliseconds: 300),
  });

  @override
  Future<List<BookModel>> getPopular() async {
    await Future.delayed(artificialDelay);
    final res = ApiResponseModel.fromJson(bookPopular);
    return res.results;
  }

  @override
  Future<List<BookModel>> getRecommended() async {
    await Future.delayed(artificialDelay);
    final res = ApiResponseModel.fromJson(bookLocal);
    return res.results;
  }

  @override
  Future<List<BookModel>> search({required String query, int page = 1}) async {
    await Future.delayed(artificialDelay);
    final res = ApiResponseModel.fromJson(bookLocal);

    final lower = query.toLowerCase();
    return res.results.where((m) {
      final title = (m.title).toLowerCase();
      return title.contains(lower);
    }).toList();
  }
}
