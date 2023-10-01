 import 'package:book_app/%20core/utils/styles.dart';
  import 'package:book_app/features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'bestseller/bestseller_list_view.dart';
import 'bestseller/custom_app_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left:24),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 30,),
              Text(
                'Newset Books',
                style: Styles.titleMedim18,
              ),
              SizedBox(height: 20,),
    ],
        ),
          ),

    ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: BestsellerListView(),
          ),
        )
      ],
    );
  }
}
