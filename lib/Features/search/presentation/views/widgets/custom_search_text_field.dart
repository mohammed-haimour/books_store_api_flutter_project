import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onFieldSubmitted});

  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onFieldSubmitted,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        label: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        suffixIcon: Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }
}
