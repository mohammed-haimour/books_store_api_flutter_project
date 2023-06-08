import 'package:books_store_app/Features/home/presentation/views/book_details_view.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:books_store_app/core/constants.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/utils/functions/navigators.dart';
import 'package:books_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goTo(context, BookDetailsView(book: book));
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              image: book.image ??
                  "https://media.istockphoto.com/id/1222357475/vector/image-preview-icon-picture-placeholder-for-website-or-ui-ux-design-vector-illustration.jpg?s=612x612&w=0&k=20&c=KuCo-dRBYV7nz2gbk4J9w1WtTAgpTdznHu55W9FjimE=",
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      book.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.author ?? "Unknow Author",
                    style: Styles.textStyle14,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                          avarageRaiting: book.raiting ?? 0,
                          raitingCount: book.raitingCount ?? 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
