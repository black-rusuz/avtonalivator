import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../widgets/basic_image.dart';

const _transition = Duration(milliseconds: 600);
const _duration = Duration(milliseconds: 2000);
const _gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0, 0.9],
  colors: [
    Colors.transparent,
    AppTheme.background,
  ],
);

class CocktailsBackground extends StatefulWidget {
  final List<String> imageUrls;

  const CocktailsBackground({super.key, required this.imageUrls});

  @override
  State<CocktailsBackground> createState() => _CocktailsBackgroundState();
}

class _CocktailsBackgroundState extends State<CocktailsBackground> {
  final controller = PageController();
  StreamSubscription? streamSub;

  @override
  void initState() {
    super.initState();
    streamSub?.cancel();
    streamSub = Stream.periodic(_duration, (i) => i).listen(animateToPage);
  }

  void animateToPage(int page) {
    page = page % widget.imageUrls.length;
    controller.animateToPage(page, duration: _transition, curve: Curves.ease);
  }

  @override
  void dispose() {
    streamSub?.cancel();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(gradient: _gradient),
      child: PageView.builder(
        controller: controller,
        itemCount: widget.imageUrls.length,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final url = widget.imageUrls[index];
    return BasicImage(url, fit: BoxFit.cover);
  }
}
