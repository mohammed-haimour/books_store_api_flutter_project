import 'package:books_store_app/core/constants.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/model/book_model/book_model.dart';
import 'package:books_store_app/core/utils/api_service.dart';
import 'package:books_store_app/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&q=computer&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);

    saveData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            "volumes?Filtering=free-ebooks&Sorting=newest&q=programming&startIndex=${pageNumber * 10}");

    List<BookEntity> books = getBooksList(data);
    saveData(books, kNewestBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
