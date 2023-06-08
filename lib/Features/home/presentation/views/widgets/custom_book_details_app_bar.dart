import 'package:books_store_app/core/utils/functions/navigators.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            back(context);
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
