import 'package:books_store_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:books_store_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:books_store_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_store_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:books_store_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:books_store_app/core/utils/api_service.dart';
import 'package:books_store_app/main.dart';
import 'package:dio/dio.dart';

void setUpSeviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(getIt.get<ApiService>())));
}
