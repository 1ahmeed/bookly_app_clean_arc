

import 'package:bookly_app/constant.dart';
import 'package:hive_flutter/adapters.dart';

import '../../domains/entities/book_entity.dart';

abstract class HomeLocalDataSource{
 List<BookEntity> fetchNewsetBooks({int pageNum=0});
 List<BookEntity> fetchFeatureBooks({int pageNum=0});
 List<BookEntity> fetchSimilarBooks({int pageNum=0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeatureBooks({int pageNum=0}) {
    int startIndex=pageNum*10;
    int endIndex=(pageNum+1)*10;
   var box=Hive.box<BookEntity>(kFeaturedBox);
   int length=box.values.length;
   if(startIndex >= length || endIndex>length){
     return [];
   }
   //box.delete(kFeaturedBox);
   return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewsetBooks({int pageNum=0}) {
    int startIndex=pageNum*10;
    int endIndex=(pageNum+1)*10;
    var box=Hive.box<BookEntity>(kNewestBox);
    int length=box.values.length;
    if(startIndex >= length || endIndex>length){
      return [];
    }
   // box.delete(kNewestBox);
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchSimilarBooks({int pageNum=0}) {
    int startIndex=pageNum*10;
    int endIndex=(pageNum+1)*10;
    var box=Hive.box<BookEntity>(kSimilarBox);
    int length=box.values.length;
    if(startIndex >= length || endIndex>length){
      return [];
    }
    //box.delete(kSimilarBox);
    return box.values.toList();
  }


}
