import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {String searchText = "all"});
}
