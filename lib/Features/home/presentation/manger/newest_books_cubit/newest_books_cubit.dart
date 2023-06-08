// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:books_store_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(
    this.fetchNewestBooksUseCase,
  ) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPagiantionLoading());
    }
    var result = await fetchNewestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailuer(failure.msg));
      } else {
        emit(NewestBooksPagenationFailure(failure.msg));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
