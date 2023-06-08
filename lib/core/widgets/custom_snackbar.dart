import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  const CustomSnackbar({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(msg),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
  }
}
