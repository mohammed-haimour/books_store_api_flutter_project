import 'package:books_store_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:books_store_app/Features/search/domain/use_cases/fetch_searched_books.dart';
import 'package:books_store_app/Features/search/presentation/manger/search_cubit/search_books_cubit.dart';
import 'package:books_store_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:books_store_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBlocProvider extends StatelessWidget {
  const SearchViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SearchBooksCubit(
            FetchSearchedBooksUseCase(getIt.get<SearchRepoImpl>()))
          ..fetchSearchedBooks();
      },
      child: const SearchViewBody(),
    );
  }
}
