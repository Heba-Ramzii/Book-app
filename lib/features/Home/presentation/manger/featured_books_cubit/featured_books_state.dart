part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errMessage;
 const FeaturedBooksFailure(this.errMessage);

}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);

}

