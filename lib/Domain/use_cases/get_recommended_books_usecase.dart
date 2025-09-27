//on get_recommended_books_usecase.dart
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/repositories/book_repository.dart';

class GetRecommendedBooksUseCase {
  final BookRepository repository;
  GetRecommendedBooksUseCase(this.repository);

  Future<List<Book>> call({int page = 1}) {
    return repository.getRecommended();
  }
}
