import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final BlendMode? blendMode;
  final Color? color;

  const ImageWidget(
      {required this.image,
      required this.fit,
      this.height,
      this.width,
      this.alignment,
      this.blendMode,
      this.color});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Loading(),
      fadeOutDuration: Duration(milliseconds: 1000),
      placeholderFadeInDuration: Duration(seconds: 1),
      alignment: alignment ?? Alignment.topCenter,
      colorBlendMode: blendMode,
      color: color,
      fit: fit,
      height: height,
      width: width,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
