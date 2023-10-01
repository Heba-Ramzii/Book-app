import 'package:book_app/%20core/errors/failures.dart';
import 'package:book_app/%20core/utils/api_service.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo{
   final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
   try {
     var data = await apiService.get(
          endPoint:
          'volumes?Sorting=newest &q=computer science');
     List<BookModel> books = [];
     for( var item in data ['items']){
       books.add(BookModel.fromJson(item));
     }
     return right(books);
   } catch (e) {
     if (e is DioException) {
        return left(
          SeverFailure.fromDioError(e),
        );
     }
     return left(
         SeverFailure(
             e.toString(),
         ),
     );
    }
   }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?&q=subject:Programming');
      List<BookModel> books = [];
      for( var item in data ['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          SeverFailure.fromDioError(e),
        );
      }
      return left(
        SeverFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String categary}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Sorting=relevance &q=computer science');
      List<BookModel> books = [];
      for( var item in data ['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          SeverFailure.fromDioError(e),
        );
      }
      return left(
        SeverFailure(
          e.toString(),
        ),
      );
    }
  }

}