import 'package:bookly_app/feature/home/presentation/views/widgets/book_details/similar_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You Can Also Like",
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListViewBlocConsumer(),
      ],
    );
  }
}

