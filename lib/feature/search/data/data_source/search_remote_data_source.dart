

import '../../../../constant.dart';
import '../../../../core/function/save_books.dart';
import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/book_model.dart';
import '../../../home/domains/entities/book_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<BookEntity>> fetchSearchBooks({required String category});
}


class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchBooks({required String category}) async {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&Sorting=newest &q=$category'
    );
    List<BookEntity> books = getBooksList(data);
    saveBox(books,kSearchBox);
    return books;
  }
}




List<BookEntity> getBooksList(Map<String, dynamic>? data) {
  List<BookEntity> books=[];
  for(var item in data !['items']) {
    books.add(BookModel.fromJson(item));
  }
  return books;
}
