import 'package:books_store_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(book: book),
      ),
    );
  }
}
