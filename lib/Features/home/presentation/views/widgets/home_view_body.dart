import 'package:books_store_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/newest_seller_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_store_app/Features/home/presentation/views/widgets/featured_books_list_view_bloc_consumer.dart';
import 'package:books_store_app/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController _scrollController;

  int nextPage = 1;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context)
            .fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const SliverAppBar(
          pinned: true,
          floating: true,
          title: CustomAppBar(),
          expandedHeight: 80,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const FeaturedBooksListvViewBlocConsumer(),
              const SizedBox(height: 50),
              const Text(
                'Newest Books',
                style: Styles.textStyle18,
              ),
              const SizedBox(height: 20),
              const NewestBooksListViewBlocConsumer()
            ]),
          ),
        ),
      ],
    );
  }
}
