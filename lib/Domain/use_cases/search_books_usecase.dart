// on  search_books_usecase.dart
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/repositories/book_repository.dart';

class SearchBooksUseCase {
  final BookRepository repository;
  SearchBooksUseCase(this.repository);

  Future<List<Book>> call({required String query, int page = 1}) {
    return repository.search(query: query, page: page);
  }
}
