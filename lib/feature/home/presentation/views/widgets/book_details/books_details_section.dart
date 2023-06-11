import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';
import 'book_action.dart';

import '../book_rating.dart';
import 'custom_book_details_app_bar.dart';
import '../custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key, required this.bookEntity, })
      : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2, vertical: 0),
          child: CustomBookImage(
              imageUrl: bookEntity.image ?? ""),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookEntity.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookEntity.author!,
            style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          count: bookEntity.count!,
          rate:bookEntity.rating!,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
         BookAction(
           bookEntity: bookEntity,
         ),
      ],
    );
  }
}
