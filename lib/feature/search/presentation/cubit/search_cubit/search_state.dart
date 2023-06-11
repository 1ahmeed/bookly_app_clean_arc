part of 'search_cubit.dart';


abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess(this.books);


}
class SearchError extends SearchState {
  final String errorMessage;

  SearchError(this.errorMessage);
}
