import 'package:book_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:book_app/features/search/presentation/views/widgets/result.dart';
import 'package:flutter/material.dart';

import '../../../../../ core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 20.0,),
          Text(
            'Search Result',
            style: Styles.titleMedim18,
          ),
          SizedBox(height: 15.0,),
          Expanded(
              child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
