import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../ core/utils/styles.dart';
import 'bestseller/book_rate.dart';
import 'book_details/book_action.dart';
 import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width*1;
    return  Column(
      children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal:width*0.2 ),
          child:   CustomBookImage(
            imgPath: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43,),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6,),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.titleMedim18.copyWith(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic
            ),
          ),
        ),
        const SizedBox(height: 18,),
            BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating:bookModel.volumeInfo.averageRating ?? 0,//bookModel.volumeInfo.averageRating! ,
          count: bookModel.volumeInfo.ratingsCount ?? 0,//bookModel.volumeInfo.ratingsCount!,
        ),
        const SizedBox(height: 37,),
          BookAction(
            bookModel: bookModel,
          ),
      ],

    );
  }
}
