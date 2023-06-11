
import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/fetch_search_books_use_case.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.featureSearchBooksUseCase) : super(SearchInitial());

  static SearchCubit? get(context) => BlocProvider.of(context);


  final FetchSearchBooksUseCase featureSearchBooksUseCase;


  Future<void> fetchSearchBooks({
  required String name
})async {
    emit(SearchLoading());
    var result = await featureSearchBooksUseCase.call(name);
    result.fold((failure) {
      emit(SearchError(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }


}
