import '../../../style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CocktailImage extends StatelessWidget {
  final String? imageUrl;
  final void Function() onTap;

  const CocktailImage({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 100),
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Style.yellow,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Style.yellowAccent,
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: CachedNetworkImage(
                  fadeInCurve: Curves.easeInSine,
                  fadeOutCurve: Curves.easeOutSine,
                  height: 160,
                  width: 160,
                  fit: BoxFit.cover,
                  imageUrl: imageUrl ?? '',
                  placeholder: (_, __) => const Icon(Icons.liquor_rounded),
                  imageBuilder: (_, img) => CircleAvatar(foregroundImage: img),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
