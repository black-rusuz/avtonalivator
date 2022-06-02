import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';

class CocktailImage extends StatelessWidget {
  final String imageUrl;

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
                child: ClipOval(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
