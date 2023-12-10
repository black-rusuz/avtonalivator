import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/cocktail.dart';
import '../../../widgets/basic_image.dart';

const _transition = Duration(milliseconds: 400);
const _duration = Duration(milliseconds: 4000);
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
  final List<UiCocktail> cocktails;

  const CocktailsBackground({super.key, required this.cocktails});

  @override
  State<CocktailsBackground> createState() => _CocktailsBackgroundState();
}

class _CocktailsBackgroundState extends State<CocktailsBackground> {
  final controller = PageController();
  final timer = StreamController<int>();
  List<StreamSubscription> subs = [];

  List<String> get imageUrls => widget.cocktails.map((e) => e.image).toList();

  @override
  void initState() {
    super.initState();
    subs.forEach(_cancelSub);
    subs = [
      Stream.periodic(_duration).listen(pageChanger),
      timer.stream.listen(animateToPage),
    ];
  }

  void pageChanger(dynamic _) {
    final page = controller.page?.round() ?? 0;
    final next = page + 1;
    timer.add(next);
  }

  void animateToPage(int page) {
    page = page % imageUrls.length;
    controller.animateToPage(page, duration: _transition, curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(gradient: _gradient),
      child: PageView.builder(
        controller: controller,
        itemCount: imageUrls.length,
        itemBuilder: itemBuilder,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final url = imageUrls[index];
    return BasicImage(url, fit: BoxFit.cover);
  }

  @override
  void dispose() {
    timer.close();
    subs.forEach(_cancelSub);
    return super.dispose();
  }
}

Future<void> _cancelSub(StreamSubscription sub) {
  return sub.cancel();
}
