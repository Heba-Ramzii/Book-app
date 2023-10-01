import 'package:flutter/material.dart';
import '../../../../../ core/utils/assets.dart';



class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         padding: EdgeInsets.zero,
        itemCount: AssetsData.images.length,
        itemBuilder: (context , index){
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            // child:   BookListViewItem(
            //     bookModel:  ,
            // ),
          );
        }
    );
  }
}
