import 'package:free_books/Infrastructure/models/book_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> fetchPopular({int page = 1});
  Future<List<BookModel>> fetchRecommended({int page = 1});
  Future<List<BookModel>> search({required String query, int page = 1});
}
