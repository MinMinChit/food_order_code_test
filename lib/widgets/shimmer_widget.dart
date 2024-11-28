import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/color_style.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: KStyle.cGray.withOpacity(0.3),
      highlightColor: KStyle.cWhite.withOpacity(0.7),
      child: child!,
    );
  }
}
