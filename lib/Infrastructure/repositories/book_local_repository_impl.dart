import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/repositories/book_repository.dart';
import 'package:free_books/Infrastructure/datasources/book_local_datasource.dart';

class BookLocalRepositoryImpl implements BookRepository {
  final BookLocalDataSource local;
  // Injected-> principio de inversion de dependencias,
  //no estamos usando la implementacion
  //concreta sino estamos usando la abstraccion

  BookLocalRepositoryImpl({required this.local});

  @override
  Future<List<Book>> getPopular() async {
    final models = await local.getPopular();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Book>> getRecommended() async {
    final models = await local.getRecommended();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Book>> search({required String query, int page = 1}) async {
    final models = await local.search(query: query, page: page);
    return models.map((m) => m.toEntity()).toList();
  }
}
