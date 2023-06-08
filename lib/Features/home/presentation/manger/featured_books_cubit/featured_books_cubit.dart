import 'package:books_store_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.fetchFeturedBooksUseCase)
      : super(FeaturedBooksInitial());

  final FetchFeturedBooksUseCase fetchFeturedBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchFeturedBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(FeaturedBooksFailuer(failure.msg));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.msg));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
