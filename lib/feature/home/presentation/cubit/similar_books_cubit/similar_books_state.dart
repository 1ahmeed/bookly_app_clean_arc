part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksPaginationLoading extends SimilarBooksState {}
class SimilarBooksPaginationError extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksPaginationError(this.errorMessage);
}
class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksError extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksError(this.errorMessage);
}
