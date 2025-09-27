import 'package:bloc/bloc.dart';
import 'package:free_books/Domain/use_cases/search_books_usecase.dart';
import 'package:free_books/UI/blocs/books/popular_books_cubit.dart';

class SearchBooksCubit extends Cubit<BooksState> {
  final SearchBooksUseCase searchBooks;

  String _lastQuery = '';
  int _currentPage = 1;
  final List _accumulated = [];

  SearchBooksCubit({required this.searchBooks}) : super(const BooksInitial());

  Future<void> search(String query, {int page = 1, bool reset = true}) async {
    if (reset) {
      _lastQuery = query;
      _currentPage = 1;
      _accumulated.clear();
      emit(const BooksLoading());
    }

    try {
      final items = await searchBooks(query: _lastQuery, page: _currentPage);
      _accumulated.addAll(items);
      emit(BooksLoaded(List.unmodifiable(_accumulated), hasMore: false));
      _currentPage++;
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future<void> loadMore() async {
    if (state is! BooksLoaded) return;
    await search(_lastQuery, page: _currentPage, reset: false);
  }
}
