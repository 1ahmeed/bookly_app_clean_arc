import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../cubit/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_list_view_bloc_builder.dart';
import 'custom_app_bar.dart';
import 'feature_books_list_view_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.7 * maxScrollLength) {
      if (!isLoading) {
        isLoading = true;
        await NewestBooksCubit.get(context)?.fetchNewestBooks(pageNum: nextPage++);
        isLoading = false;
      }
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeatureBooksListViewBlocConsumer(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Newest Books",
              style: Styles.textStyle18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: BestSellerListViewBlocConsumer(),
          ),

        ],
      ),
    );

  }
}

