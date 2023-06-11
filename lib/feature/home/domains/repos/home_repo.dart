import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';

abstract class HomeRepo{
  Future<Either<Failures,List<BookEntity>>> fetchFeatureBooks({int pageNum=0});
  Future<Either<Failures,List<BookEntity>>> fetchNewsetBooks({int pageNum=0});
  Future<Either<Failures,List<BookEntity>>> fetchSimilarBooks({required String category,int pageNum=0});



}