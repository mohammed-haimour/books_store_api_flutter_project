import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
