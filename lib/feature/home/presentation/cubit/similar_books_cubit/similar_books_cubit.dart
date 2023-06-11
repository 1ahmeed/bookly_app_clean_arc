import 'package:bookly_app/feature/home/domains/use_cases/fetch_similar_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domains/entities/book_entity.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.fetchSimilarBooksUseCase) : super(SimilarBooksInitial());
  static SimilarBooksCubit? get(context) => BlocProvider.of(context);

  FetchSimilarBooksUseCase fetchSimilarBooksUseCase;

  Future<void> fetchSimilarBooks({
   String? category,
    int pageNum=0
})async {
    if(pageNum==0) {
      emit(SimilarBooksLoading());
    }else{
      emit(SimilarBooksPaginationLoading());
    }
    var result = await fetchSimilarBooksUseCase.call(category,pageNum);
    result.fold((failure) {
      if(pageNum==0) {
        emit(SimilarBooksError(failure.errorMessage));
      }else{
        emit(SimilarBooksPaginationError(failure.errorMessage));
      }
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
