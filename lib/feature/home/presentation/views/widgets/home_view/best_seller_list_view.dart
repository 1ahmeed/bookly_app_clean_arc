
import 'package:flutter/material.dart';
import '../../../../domains/entities/book_entity.dart';
import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
   const BestSellerListView({Key? key, required this.books}) : super(key: key);
final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount:books.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(
            bookEntity:books[index],
          ),
        ));
  }
}
