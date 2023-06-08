import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/model/book_model/book_model.dart';
import 'package:books_store_app/core/utils/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks({String searchText = "all"});
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchedBooks(
      {String searchText = "all"}) async {
    var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=$searchText");

    List<BookEntity> books = getBooksList(data);
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
