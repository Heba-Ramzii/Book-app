import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/presentation/views/widgets/book_details/book_custom_app_bar.dart';
import 'package:book_app/features/Home/presentation/views/widgets/book_details/similar_books_section.dart';
import 'package:book_app/features/Home/presentation/views/widgets/book_details_section.dart';
 import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return     CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children:  [
                  const BookCustomAppBar(),
                  BookDetailsSection(
                    bookModel: bookModel,
                  ),
                  const Expanded(
                    child: SizedBox(height: 50,)),
                  const SimilarBooksSection(),
                  const SizedBox(height: 40,),

              ],
            ),
          ),
        )
      ],

    );
  }
}
