import 'package:books_store_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:books_store_app/Features/search/presentation/manger/search_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  book: state.books[index]
                ),
              );
            },
          );
        } else if (state is SearchBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchBooksFailure) {
          return Center(
            child: Text(state.err),
          );
        } else {
          return const Center(
            child: Text("Amm... wait for a Sec.."),
          );
        }
      },
    );
  }
}
