import 'package:bookly_app/feature/home/presentation/views/widgets/book_details/book_details_view_body.dart';
import 'package:flutter/material.dart';

import '../../domains/entities/book_entity.dart';
import '../cubit/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends  StatefulWidget {
  const BookDetailsView({Key? key, required this.bookEntity}) : super(key: key);
final BookEntity bookEntity;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
 SimilarBooksCubit.get(context)?.fetchSimilarBooks(
   category: widget.bookEntity.categories!
 );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsViewBody(
        bookEntity:  widget.bookEntity,
      )),
    );
  }
}
