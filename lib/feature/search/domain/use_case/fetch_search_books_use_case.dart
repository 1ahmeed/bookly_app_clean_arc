



import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../home/domains/entities/book_entity.dart';
import '../repos/search_repo.dart';

class FetchSearchBooksUseCase extends UseCase<List<BookEntity>,String>{
  final SearchRepo searchRepo;

  FetchSearchBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call( [String? param]) async{
    return await searchRepo.fetchSearchBooks( category: param!);
  }



}
