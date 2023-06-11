part of 'feature_books_cubit.dart';

@immutable
abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}
class FeatureBooksPaginationLoading extends FeatureBooksState {}
class FeatureBooksPaginationError extends FeatureBooksState {
  final String errorMessage;

  FeatureBooksPaginationError(this.errorMessage);
}
class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntity> books;

  FeatureBooksSuccess(this.books);
}
class FeatureBooksError extends FeatureBooksState {
  final String errorMessage;

  FeatureBooksError(this.errorMessage);
}
