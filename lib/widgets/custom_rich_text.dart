import 'package:flutter/material.dart';
import 'package:food_order_test/constants/color_style.dart';

class SimpleAndUnderScoreText extends StatelessWidget {
  const SimpleAndUnderScoreText(
      {super.key, required this.simpleText, required this.underScoreText});

  final String simpleText;
  final String underScoreText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: simpleText,
        style: KStyle.tTextMain, // Default style
        children: [
          TextSpan(
            text: underScoreText,
            style: KStyle.tTextMain.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: KStyle.cBlue,
              color: KStyle.cBlue,
            ),
          ),
        ],
      ),
    );
  }
}
