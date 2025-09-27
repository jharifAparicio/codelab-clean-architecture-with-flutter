import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/repositories/book_repository.dart';

class GetPopularBooksUseCase {
  final BookRepository repository;
  GetPopularBooksUseCase(this.repository);

  Future<List<Book>> call({int page = 1}) {
    return repository.getPopular();
  }
}
