import 'package:books_store_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/newest_list_view.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({super.key});
  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPagenationFailure) {
          const CustomSnackbar(msg: "An error occurred.");
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPagiantionLoading ||
            state is NewestBooksPagenationFailure) {
          return NewestBooksListView(
            books: books,
          );
        } else if (state is NewestBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewestBooksFailuer) {
          return Center(
            child: Text(state.err),
          );
        } else {
          return const Text("Oops...");
        }
      },
    );
  }
}
