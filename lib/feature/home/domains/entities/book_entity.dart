

import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? author;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
   @HiveField(6)
   final num? count;
  @HiveField(7)
  final String? categories;
  @HiveField(8)
  final String? previewLink;


  BookEntity({
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.bookId,
    required this.count,
    required this.categories,
    required this.previewLink,
  });
}
