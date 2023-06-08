// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'book_entiti.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final num? raiting;
  @HiveField(4)
  final num? raitingCount;
  @HiveField(5)
  final String url;
  BookEntity(
      {required this.image,
      required this.title,
      required this.author,
      required this.raiting,
      required this.raitingCount,
      required this.url});
}
