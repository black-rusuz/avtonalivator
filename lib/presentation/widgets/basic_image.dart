import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

const _defaultRadius = BorderRadius.all(Radius.circular(4));

class BasicImage extends StatelessWidget {
  final String? _source;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry borderRadius;

  const BasicImage(
    this._source, {
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.borderRadius = _defaultRadius,
  });

  String get source => _source ?? '';

  bool get isUrl => source.contains('http');

  bool get isSvg => source.contains('svg');

  @override
  Widget build(BuildContext context) {
    if (source.isEmpty) return SizedBox(height: height, width: width);

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

  Widget buildSvg(BuildContext context, Object __, dynamic ___) => isUrl
      ? SvgPicture.network(source, height: height, width: width, fit: fit)
      : SvgPicture.asset(source, height: height, width: width, fit: fit);

  ImageProvider get provider => isUrl
      ? CachedNetworkImageProvider(source)
      : AssetImage(source) as ImageProvider;

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
}
