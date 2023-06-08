// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:books_store_app/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:books_store_app/Features/search/domain/use_cases/fetch_searched_books.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(
    this.fetchSearchedBooksUseCase,
  ) : super(SearchBooksInitial());

  final FetchSearchedBooksUseCase fetchSearchedBooksUseCase;

  Future<void> fetchSearchedBooks({String searchText = "all"}) async {
    emit(SearchBooksLoading());
    if (searchText.length > 2) {
      var result = await fetchSearchedBooksUseCase.call(searchText);

      result.fold((err) {
        emit(SearchBooksFailure(err.toString()));
      }, (books) {
        emit(SearchBooksSuccess(books));
      });
    } else {
      const CustomSnackbar(msg: "Please Fill Search Field");
    }
  }
}
