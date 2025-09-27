import 'package:bloc/bloc.dart';
import 'package:free_books/Domain/use_cases/get_recommended_books_usecase.dart';
import 'package:free_books/UI/blocs/books/popular_books_cubit.dart';

class RecommendedBooksCubit extends Cubit<BooksState> {
  final GetRecommendedBooksUseCase getRecommendedBooks;
  RecommendedBooksCubit({required this.getRecommendedBooks})
    : super(const BooksInitial());

  Future<void> load({int page = 1}) async {
    emit(const BooksLoading());
    try {
      final items = await getRecommendedBooks(page: page);
      emit(BooksLoaded(items, hasMore: false));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }
}
