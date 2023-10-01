import 'package:book_app/%20core/widgets/custom_eror_widget.dart';
import 'package:book_app/%20core/widgets/custom_loading_widget.dart';
import 'package:book_app/features/Home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_book_image.dart';

class SimilarBookListview extends StatelessWidget {
  const SimilarBookListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (BuildContext context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                  return     Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imgPath: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  );
                }),
          );
        }else if(state is SimilarBooksFailure){
          return CustomError(errMessage: state.errMessage);
        }else
          return const CustomLoading();
      }
    );
  }
}
