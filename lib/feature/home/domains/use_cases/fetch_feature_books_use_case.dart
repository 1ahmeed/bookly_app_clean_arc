import 'package:bookly_app/feature/home/domains/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([int? param = 0]) async {
    return await homeRepo.fetchFeatureBooks(pageNum: param!);
  }
}
