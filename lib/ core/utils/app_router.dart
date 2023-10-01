import 'package:book_app/%20core/utils/service_locator.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo_imple.dart';
import 'package:book_app/features/Home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/book_details_view.dart';
import 'package:book_app/features/Home/presentation/views/home_view.dart';
import 'package:book_app/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kHomeView ='/homeView';
  static const kBookView ='/bookView';
  static const kSearchView ='/searchView';

  static  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (  context,   state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (  context,   state) => const HomeView(),
      ),
      GoRoute(
        path: kBookView,
        builder: (  context,   state) => BlocProvider(
            create: ( context) => SimilarBooksCubit(
                      getIt.get<HomeRepoImpl>(),
            ),
            child:  BookDetailsView(
              bookModel: state.extra as BookModel,
            ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (  context,   state) => const SearchView(),
      ),
    ],
  );
}