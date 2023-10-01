import 'package:book_app/%20core/errors/failures.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {

  Future<Either<Failure,List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks(
      {required String categary});
}
