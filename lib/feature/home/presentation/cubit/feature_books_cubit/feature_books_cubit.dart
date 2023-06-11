

import 'package:bookly_app/feature/home/domains/use_cases/fetch_feature_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domains/entities/book_entity.dart';


part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featureBooksUseCase) : super(FeatureBooksInitial());

  static FeatureBooksCubit? get(context) => BlocProvider.of(context);

final FetchFeatureBooksUseCase featureBooksUseCase;
  Future<void> fetchFeatureBooks({int pageNum=0})async {
    if(pageNum==0){
      emit(FeatureBooksLoading());
    }else{
      emit(FeatureBooksPaginationLoading());
    }

    var result = await featureBooksUseCase.call(pageNum);
    result.fold((failure) {
      if(pageNum==0){
        emit(FeatureBooksError(failure.errorMessage));
      }else{
        emit(FeatureBooksPaginationError(failure.errorMessage));
      }

    }, (books) {
      emit(FeatureBooksSuccess(books));
    });
  }
}
