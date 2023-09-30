import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const AnimatedText(
    this.text, {
    super.key,
    required this.duration,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
