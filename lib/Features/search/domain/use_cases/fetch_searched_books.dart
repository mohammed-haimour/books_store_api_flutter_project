import 'package:books_store_app/Features/search/domain/repos/search_repo.dart';
import 'package:books_store_app/Features/search/domain/use_cases/search_use_case.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchSearchedBooksUseCase extends SearchUseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  FetchSearchedBooksUseCase(this.searchRepo);
  
  @override
  Future<Either<Failure, List<BookEntity>>> call([String searchText = "all"]) async{
    return await searchRepo.fetchSearchedBooks(
      searchText: searchText
    );
  }


}
