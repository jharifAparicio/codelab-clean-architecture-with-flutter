import 'package:free_books/data/book_local.dart';
import 'package:free_books/models/book.dart';

class BookRepository {
  static Future<List<Book>> fetchBooks() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return ApiResponse.fromJson(
        bookLocal,
      ).results; // Return an empty list for now
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Book>> fetchBooksPopular() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return ApiResponse.fromJson(
        bookPopular,
      ).results; // Return an empty list for now
    } catch (e) {
      rethrow;
    }
  }
}
