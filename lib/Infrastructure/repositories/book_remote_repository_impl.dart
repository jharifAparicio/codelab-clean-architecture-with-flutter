import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/repositories/book_repository.dart';
import 'package:free_books/Infrastructure/datasources/book_remote_datasource.dart';

class BookRemoteRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remote;
  BookRemoteRepositoryImpl({required this.remote});

  @override
  Future<List<Book>> getPopular({int page = 1}) async {
    final res = await remote.fetchPopular(page: page);
    return res.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Book>> getRecommended({int page = 1}) async {
    final res = await remote.fetchRecommended(page: page);
    return res.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<Book>> search({required String query, int page = 1}) async {
    final res = await remote.search(query: query, page: page);
    return res.map((m) => m.toEntity()).toList();
  }
}
