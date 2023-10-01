import 'package:book_app/%20core/widgets/custom_eror_widget.dart';
import 'package:book_app/%20core/widgets/custom_loading_widget.dart';
import 'package:book_app/features/Home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../ core/utils/app_router.dart';
import '../../../../../ core/utils/assets.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksState>(
        builder: (BuildContext context, state) {
          if (state is FeaturedBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: AssetsData.images.length,
                  itemBuilder: (context , index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(
                            AppRouter.kBookView,
                            extra: state.books[index],
                          );
                        },
                        child: CustomBookImage(
                          imgPath: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is FeaturedBooksFailure){
            return CustomError(errMessage: state.errMessage);
          }else {
            return const CustomLoading();
          }
        },

    );
  }
}
