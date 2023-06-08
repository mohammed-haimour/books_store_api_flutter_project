import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(image: book.image ?? ""),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.title,
          maxLines: 5,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.author ?? "Unknow Author",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
            mainAxisAlignment: MainAxisAlignment.center,
            avarageRaiting: 23,
            raitingCount: 23),
        const SizedBox(
          height: 37,
        ),
        BooksAction(
          onButtonpressed: () {
            String url = book.url;
            // ignore: deprecated_member_use
            launch(url, forceSafariVC: false);
          },
        ),
      ],
    );
  }
}
