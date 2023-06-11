



import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../home/domains/entities/book_entity.dart';

abstract class SearchRepo{
  Future<Either<Failures,List<BookEntity>>> fetchSearchBooks({required String category});



}