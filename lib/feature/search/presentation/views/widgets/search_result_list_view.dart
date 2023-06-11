import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/feature/search/presentation/cubit/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/widgets/home_view/best_seller_list_view_item.dart';



class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount:state.books.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BookListViewItem(bookEntity: state.books[index]),
              ));
        } else if(state is SearchError) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else if(state is SearchLoading){
          return  const Center(child: CircularProgressIndicator());
        }return const SizedBox();
      },
    );
  }
}
