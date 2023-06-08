import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, this.onButtonpressed});

  final void Function()? onButtonpressed ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: onButtonpressed,
            fontSize: 16,
            text: 'Enroll Now',
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(15),
          )),
        ],
      ),
    );
  }
}
