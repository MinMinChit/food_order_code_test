import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheNetworkImageWidget extends StatelessWidget {
  const CacheNetworkImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.borderRadius,
    this.boxFit,
  });

  final String url;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.cover,
        errorWidget: (context, url, error) => SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: Icon(Icons.error),
          ),
        ),
        placeholder: (context, url) => SizedBox(
          width: width,
          height: height,
          child: const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}
