import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'common/animated_text.dart';

class LaunchSplash extends StatelessWidget {
  final bool animate;
  final Duration duration;

  const LaunchSplash({
    Key? key,
    required this.animate,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.yellow,
      body: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.easeOutCubic,
            duration: duration,
            top: !animate ? 100 : 170,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AnimatedText(
                  'Автобармен',
                  style: Style.launchHeader,
                  duration: duration,
                  animate: animate,
                ),
                AnimatedText(
                  'Система автоналива напитков',
                  style: Style.launchSubheader,
                  duration: duration,
                  animate: animate,
                ),
              ],
            ),
          ),
          Center(
            child: Stack(
              children: [
                SvgPicture.asset('assets/barmen.svg'),
                AnimatedPositioned(
                  duration: duration,
                  curve: Curves.easeInQuart,
                  top: !animate ? 29 : 52,
                  left: 87.5,
                  child: const Text(
                    '•',
                    style: TextStyle(fontSize: 20, color: Style.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
