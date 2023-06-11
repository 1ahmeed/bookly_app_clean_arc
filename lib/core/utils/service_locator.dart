import 'package:bookly_app/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/data/data_sources/home_remote_data_source.dart';
import '../../feature/search/data/repos/search_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeLocalDataSource: HomeLocalDataSourceImpl(),
        homeRemoteDataSource:
            HomeRemoteDataSourceImpl(getIt.get<ApiService>())),
  );

  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
        searchRemoteDataSource:
            SearchRemoteDataSourceImpl(getIt.get<ApiService>())),
  );
}
