import 'package:books_store_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchUseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param searchText]);
}

class NoParam {}
