part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksPaginationLoading extends FeaturedBooksState {}
class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String err;

  FeaturedBooksPaginationFailure(this.err);
}
class FeaturedBooksFailuer extends FeaturedBooksState {
  final String err;

  FeaturedBooksFailuer(this.err);
}
