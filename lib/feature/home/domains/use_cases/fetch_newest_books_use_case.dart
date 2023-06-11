

import 'package:bookly_app/core/errors/failuer.dart';
import 'package:bookly_app/feature/home/domains/entities/book_entity.dart';
import 'package:bookly_app/feature/home/domains/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>,int> {

  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([int? param=0])async {
    return await homeRepo.fetchNewsetBooks(
      pageNum: param!
    );
  }

}