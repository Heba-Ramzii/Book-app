import 'package:book_app/features/Home/data/repos/home_repo_imple.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio(),));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
       getIt.get<ApiService>(),
      ),
  );

 }