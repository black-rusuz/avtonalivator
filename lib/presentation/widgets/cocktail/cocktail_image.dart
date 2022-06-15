import 'package:avtonalivator/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CocktailImage extends StatelessWidget {
  final String? imageUrl;

  const CocktailImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 100),
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Style.yellow,
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
