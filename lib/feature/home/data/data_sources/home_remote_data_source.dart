import 'package:bookly_app/constant.dart';

import '../../../../core/function/save_books.dart';
import '../../../../core/utils/api_service.dart';
import '../../domains/entities/book_entity.dart';
import '../models/book_model.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchNewsetBooks({int pageNum=0});
  Future<List<BookEntity>> fetchFeatureBooks({int pageNum=0});
  Future<List<BookEntity>> fetchSimilarBooks({required String category,int pageNum=0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNum=0}) async{
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:programming&startIndex=${pageNum * 10}'
      );
      List<BookEntity> books = getBooksList(data);
      saveBox(books,kFeaturedBox);
      return books;
    }


  @override
  Future<List<BookEntity>> fetchNewsetBooks({int pageNum=0}) async{
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNum * 10}'

    );
    List<BookEntity> books = getBooksList(data);
    saveBox(books,kNewestBox);
    return books;
  }
  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category,int pageNum=0}) async  {
    var data = await apiService.get(
        endPoint:
        'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category&startIndex=${pageNum * 10}'
    );
    List<BookEntity> books = getBooksList(data);
    saveBox(books,kNewestBox);
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

