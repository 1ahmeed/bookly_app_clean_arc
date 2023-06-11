import 'package:bookly_app/core/function/launch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../domains/entities/book_entity.dart';

class BookAction extends StatelessWidget {
  const BookAction({Key? key, required this.bookEntity}) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: CustomButton(
              text: r"199 $",
              fontSize: 15,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookEntity.previewLink);
              },
              text: getText(bookEntity),
              fontSize: 15,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getText(BookEntity bookEntity) {
    if (bookEntity.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
