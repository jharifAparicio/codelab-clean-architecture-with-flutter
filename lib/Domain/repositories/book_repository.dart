import 'package:free_books/Domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getRecommended();
  Future<List<Book>> getPopular();
  Future<List<Book>> search({required String query, int page = 1});
}
