import 'package:hive_flutter/adapters.dart';

import '../../feature/home/domains/entities/book_entity.dart';

void saveBox(List<BookEntity> books,String booksName) {
  var box=Hive.box<BookEntity>(booksName);
  box.addAll(books);
}
