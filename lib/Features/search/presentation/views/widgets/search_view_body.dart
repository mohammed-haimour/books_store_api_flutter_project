import 'package:books_store_app/Features/search/presentation/manger/search_cubit/search_books_cubit.dart';
import 'package:books_store_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:books_store_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:books_store_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomSearchTextField(
            onFieldSubmitted: (val) async {
              await BlocProvider.of<SearchBooksCubit>(context)
                  .fetchSearchedBooks(searchText: val);
            },
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Search Result',
                style: Styles.textStyle18,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SearchResultListView(),
              ),
            ],
          ),
        ));
  }
}
