import 'package:flutter/material.dart';

import '../../../../domains/entities/book_entity.dart';
import '../../../cubit/similar_books_cubit/similar_books_cubit.dart';
import '../custom_book_image.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
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
        await SimilarBooksCubit.get(context)?.fetchSimilarBooks(
            pageNum: nextPage++, category: widget.books[0].categories);

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
    return SizedBox(
      height: MediaQuery.of(context).size.height * .16,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: CustomBookImage(imageUrl: widget.books[index].image ?? ""),
            );
          },
        ),
      ),
    );
  }
}
