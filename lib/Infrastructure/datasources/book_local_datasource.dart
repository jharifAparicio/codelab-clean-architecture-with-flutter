// infrastructure/datasource -> book_local_datasource.dart
import 'package:free_books/Infrastructure/models/book_model.dart';

abstract class BookLocalDataSource {
  Future<List<BookModel>> getRecommended();
  Future<List<BookModel>> getPopular();
  Future<List<BookModel>> search({required String query, int page = 1});
}
