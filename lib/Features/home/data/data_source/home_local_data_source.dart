import 'package:books_store_app/core/constants.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var books = Hive.box<BookEntity>(kFeaturedBox);
    int length = books.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return books.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var books = Hive.box<BookEntity>(kNewestBox);
    int length = books.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return books.values.toList().sublist(startIndex, endIndex);
  }
}
