import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

const _defaultRadius = BorderRadius.all(Radius.circular(4));

class BasicImage extends StatelessWidget {
  final String? source;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  const BasicImage(
    this.source, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.borderRadius = _defaultRadius,
  });

  String get uri => source ?? '';

  bool get isUrl => uri.contains('http');

  bool get isSvg => uri.contains('svg');

  ImageProvider get provider => isUrl
      ? CachedNetworkImageProvider(uri)
      : AssetImage(uri) as ImageProvider;

  Widget buildSvg(BuildContext context, Object __, dynamic ___) => isUrl
      ? SvgPicture.network(uri, height: height, width: width, fit: fit)
      : SvgPicture.asset(uri, height: height, width: width, fit: fit);

  Widget skeleton(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress == null) return child;
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white10,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: isSvg
          ? buildSvg(context, '', null)
          : Image(
              image: provider,
              height: height,
              width: width,
              fit: fit,
              loadingBuilder: skeleton,
              errorBuilder: buildSvg,
            ),
    );
  }
}
