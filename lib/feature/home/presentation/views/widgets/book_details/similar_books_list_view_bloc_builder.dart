import 'package:bookly_app/feature/home/presentation/cubit/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/views/widgets/book_details/similar_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../domains/entities/book_entity.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    Key? key,
  }) : super(key: key);

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _SimilarBooksListViewBlocConsumerState();
}

class _SimilarBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if(state is SimilarBooksSuccess){
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess||
            state is SimilarBooksPaginationError||
            state is SimilarBooksPaginationLoading
        ) {
          return SimilarBooksListView(books: books);
        } else if (state is SimilarBooksError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
