import '../../../style.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Duration duration;
  final bool animate;

  const AnimatedText(
    this.text, {
    super.key,
    required this.style,
    required this.duration,
    required this.animate,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: duration,
      style: style.copyWith(
        color: !animate ? Colors.transparent : Style.black,
      ),
      child: Text(text),
    );
  }
}
