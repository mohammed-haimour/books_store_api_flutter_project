import 'package:books_store_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class FeaturedBooksListvViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListvViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListvViewBlocConsumer> createState() =>
      _FeaturedBooksListvViewBlocConsumerState();
}
  List<BookEntity> books = [];

class _FeaturedBooksListvViewBlocConsumerState
    extends State<FeaturedBooksListvViewBlocConsumer> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          print("--1");
            books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          print("--2");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('An error occurred.'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 30),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          print("3 --> ${books}");
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksLoading) {
          print("4");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FeaturedBooksFailuer) {
          print("5");
          return Center(
            child: Text(state.err),
          );
        } else {
          print("6");
          return const Text("Oops...");
        }
      },
    );
  }
}
