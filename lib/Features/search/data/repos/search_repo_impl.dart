import 'package:books_store_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:books_store_app/Features/search/domain/repos/search_repo.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {String searchText = "all"}) async {
    try {
      var books =
          await searchRemoteDataSource.fetchSearchedBooks(searchText: searchText);
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
