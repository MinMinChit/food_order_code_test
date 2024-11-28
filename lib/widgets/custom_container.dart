import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

import '../constants/color_style.dart';

class InnerShadowContainer extends StatelessWidget {
  const InnerShadowContainer({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.child,
  });

  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shadows: [
          BoxShadow(
            color: KStyle.cBlack.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(0, -1),
            blurRadius: 3.5,
            color: KStyle.cWhite,
          ),
        ],
        shape: SmoothRectangleBorder(
          side: BorderSide(
            color: KStyle.cStroke,
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 8,
            cornerSmoothing: 0.9,
          ),
          borderAlign: BorderAlign.inside,
        ),
      ),
      child: child,
    );
  }
}
