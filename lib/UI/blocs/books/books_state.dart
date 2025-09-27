part of 'popular_books_cubit.dart';

sealed class BooksState extends Equatable {
  const BooksState();
  @override
  List<Object?> get props => [];
}

class BooksInitial extends BooksState {
  const BooksInitial();
}

class BooksLoading extends BooksState {
  const BooksLoading();
}

class BooksLoaded extends BooksState {
  final List<Book> items;
  final bool hasMore;
  const BooksLoaded(this.items, {this.hasMore = false});

  @override
  List<Object?> get props => [items, hasMore];
}

class BooksError extends BooksState {
  final String message;
  const BooksError(this.message);

  @override
  List<Object?> get props => [message];
}
