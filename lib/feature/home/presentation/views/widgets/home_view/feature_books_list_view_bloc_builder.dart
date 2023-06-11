import 'package:bookly_app/core/function/custom_snackbar.dart';
import 'package:bookly_app/feature/home/presentation/cubit/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/feature/home/presentation/views/widgets/home_view/feature_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../domains/entities/book_entity.dart';
import 'feature_list_view.dart';

class FeatureBooksListViewBlocConsumer extends StatefulWidget {
  const FeatureBooksListViewBlocConsumer({
    Key? key,
  }) : super(key: key);

  @override
  State<FeatureBooksListViewBlocConsumer> createState() =>
      _FeatureBooksListViewBlocConsumerState();
}

class _FeatureBooksListViewBlocConsumerState
    extends State<FeatureBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: (context, state) {
        if (state is FeatureBooksSuccess) {
          books.addAll(state.books);
        }
        if(state is FeatureBooksPaginationError){
          customSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FeatureBooksSuccess ||
            state is FeatureBooksPaginationLoading||
        state is FeatureBooksPaginationError) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeatureBooksError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const FeatureBooksListViewLoadingIndicator();
          //return const CustomLoadingIndicator();

        }
      },
    );
  }
}
