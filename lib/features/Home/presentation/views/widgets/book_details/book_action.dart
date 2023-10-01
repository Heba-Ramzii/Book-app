import 'package:book_app/%20core/utils/function/launch_url.dart';
import 'package:book_app/%20core/widgets/custom_button.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children:[
          const Expanded(
              child: CustomButton(
                text:  'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              )),
          Expanded(
              child: CustomButton(
                onPressed:()  {
                  launchCustomUrl(
                      context,
                      bookModel.volumeInfo.previewLink!
                  );
                 } ,
                text: getText(bookModel),
                fontSize: 16,
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius:  const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),

                ),
              )),

        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return "Not Available";
    }else{
      return "Preview";
    }
  }
}
