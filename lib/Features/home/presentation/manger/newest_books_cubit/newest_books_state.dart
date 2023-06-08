part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksPagiantionLoading extends NewestBooksState {}
class NewestBooksPagenationFailure extends NewestBooksState {
    final String err;

  NewestBooksPagenationFailure(this.err);
}
class NewestBooksFailuer extends NewestBooksState {
  final String err;

  NewestBooksFailuer(this.err);
}
