import 'package:bookly_app/feature/home/domains/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domains/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());

  static NewestBooksCubit? get(context) => BlocProvider.of(context);

  FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());

    }
    var result = await fetchNewestBooksUseCase.call(pageNum);
    result.fold((failure) {
      if(pageNum==0) {
        emit(NewestBooksError(failure.errorMessage));
      }else{
        NewestBooksPaginationError(failure.errorMessage);
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
