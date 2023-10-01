import 'package:bloc/bloc.dart';
import 'package:book_app/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
   var result = await  homeRepo.fetchFeaturedBooks();
       result.fold(
               (failure) {
                 emit(FeaturedBooksFailure(failure.error));
               },
               (books)  {
                 emit(FeaturedBooksSuccess(books));
               },
       ) ;
   
  }

}
