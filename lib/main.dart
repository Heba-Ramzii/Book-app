import 'package:book_app/%20core/utils/app_router.dart';
import 'package:book_app/%20core/utils/service_locator.dart';
import 'package:book_app/constants/constants.dart';
import 'package:book_app/features/Home/data/repos/home_repo_imple.dart';
import 'package:book_app/features/Home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/Home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  setup();
  runApp(const BookApp());
}

 class BookApp extends StatefulWidget {
   const BookApp({super.key});

  @override
  State<BookApp> createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
   @override
   Widget build(BuildContext context) {
     return MultiBlocProvider(
       providers: [
         BlocProvider(
           create : (context) =>
             FeaturedBooksCubit(
                 getIt.get<HomeRepoImpl>()
             )..fetchFeaturedBooks(),
         ),

         BlocProvider(
           create : (context) =>
             NewsetBooksCubit(
                 getIt.get<HomeRepoImpl>(),
             )..fetchNewsetBooks(),
         ),
       ],
       child:MaterialApp.router(
           routerConfig: AppRouter.router,
           debugShowCheckedModeBanner: false,
           theme: ThemeData.dark()
               .copyWith(
             scaffoldBackgroundColor: kPrimaryColor,
             textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
           ),
       ),
     );

    }
}


 
