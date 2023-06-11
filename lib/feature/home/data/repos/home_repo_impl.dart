import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domains/repos/home_repo.dart';
import '../data_sources/home_local_data_source.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0}) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks(pageNum: pageNum);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks(pageNum: pageNum);
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewsetBooks({int pageNum=0}) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchNewsetBooks(pageNum: pageNum);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsetBooks(pageNum: pageNum);
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSimilarBooks(
      {required String category,int pageNum=0}) async {
    try {
      List<BookEntity> books;
      books= homeLocalDataSource.fetchSimilarBooks(pageNum: pageNum);
      if(books.isNotEmpty){
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category,pageNum:pageNum);
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
