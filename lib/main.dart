import 'package:books_store_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_store_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:books_store_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:books_store_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:books_store_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store_app/Features/splash/presentation/views/splash_view.dart';
import 'package:books_store_app/core/constants.dart';
import 'package:books_store_app/core/domain/entities/book_entiti.dart';
import 'package:books_store_app/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  setUpSeviceLocator();
  runApp(const Bookly());
}

final getIt = GetIt.instance;

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) {
          return FeaturedBooksCubit(
              FetchFeturedBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchFeaturedBooks();
        })),
        BlocProvider(create: ((context) {
          return NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()))
            ..fetchNewestBooks();
        })),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            appBarTheme: const AppBarTheme(backgroundColor: kPrimaryColor)),
        home: const SplashView(),
      ),
    );
  }
}
