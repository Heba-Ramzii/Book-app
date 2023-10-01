import 'package:book_app/%20core/widgets/custom_eror_widget.dart';
import 'package:book_app/features/Home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../ core/widgets/custom_loading_widget.dart';

class BestsellerListView extends StatelessWidget {
  const BestsellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit,NewsetBooksState>(
      builder: (BuildContext context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context , index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:   BookListViewItem(
                    bookModel:state.books[index] ,
                  ),
                );
              }
          );
        } else if (state is NewsetBooksFailure){
          return CustomError(errMessage: state.errMessage);
        }else {
              return const CustomLoading();
    }
      },

    );
  }
}
