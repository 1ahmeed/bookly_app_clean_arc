part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationError extends NewestBooksState {
  final String errorMessage;

  NewestBooksPaginationError(this.errorMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksError extends NewestBooksState {
  final String errorMessage;

  NewestBooksError(this.errorMessage);
}
