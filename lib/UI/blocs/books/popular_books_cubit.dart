import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Domain/use_cases/get_popular_books_usecase.dart';

part 'books_state.dart';

class PopularBooksCubit extends Cubit<BooksState> {
  final GetPopularBooksUseCase getPopularBooks;
  PopularBooksCubit({required this.getPopularBooks})
    : super(const BooksInitial());

  Future<void> load({int page = 1}) async {
    emit(const BooksLoading());
    try {
      final items = await getPopularBooks(page: page);
      emit(BooksLoaded(items, hasMore: false));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}
