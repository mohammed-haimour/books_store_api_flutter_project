import 'package:books_store_app/Features/home/domain/repos/home_repo.dart';
import 'package:books_store_app/Features/home/domain/use_cases/use_case.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int pageNumber = 0]) async{
    return await homeRepo.fetchNewestBooks(
      pageNumber: pageNumber
    );
  }
}
