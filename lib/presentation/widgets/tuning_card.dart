import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'common/base_card.dart';

class TuningCard extends StatefulWidget {
  final int position;

  const TuningCard({Key? key, required this.position}) : super(key: key);

  @override
  State<TuningCard> createState() => _TuningCardState();
}

class _TuningCardState extends State<TuningCard> {
  bool isActive = false;
  int volume = 25;

  Color get black => const Color.fromRGBO(1, 0, 2, 1);

  Color get grey => const Color.fromRGBO(196, 196, 196, 1);

  TextStyle get numberStyle => TextStyle(
        fontSize: 96,
        color: isActive ? black.withOpacity(0.1) : grey.withOpacity(0.2),
      );

  TextStyle get textStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: black,
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: isActive ? black.withOpacity(0.7) : grey,
      );

  SliderThemeData get sliderStyle => SliderTheme.of(context).copyWith(
        trackHeight: 5,
        activeTrackColor: isActive ? black : Style.yellow,
        inactiveTrackColor: isActive
            ? Colors.white.withOpacity(0.7)
            : const Color.fromRGBO(237, 237, 237, 1),
        thumbColor: isActive ? black : Style.yellow,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 2.5,
          elevation: 0,
          pressedElevation: 0,
        ),
        overlayColor: Colors.transparent,
        overlayShape: SliderComponentShape.noThumb,
      );

  void setActive(value) => setState(() => isActive = value);

  void setVolume(value) => setState(() => volume = value.round());

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      height: 85,
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      isActive: isActive,
      duration: 100,
      child: Stack(
        children: [
          Positioned(
            top: -12,
            left: 10,
            child: Text(widget.position.toString(), style: numberStyle),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 16),
                  child: Row(children: [
                    Text('Помпа', style: textStyle),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('$volumeмл', style: volumeStyle),
                    ),
                    const Expanded(child: SizedBox()),
                    FlutterSwitch(
                      height: 25,
                      width: 50,
                      toggleSize: 21,
                      borderRadius: 25,
                      padding: 2,
                      activeColor: black.withOpacity(0.7),
                      inactiveColor: grey,
                      value: isActive,
                      onToggle: setActive,
                    ),
                  ]),
                ),
                Expanded(
                  child: SliderTheme(
                    data: sliderStyle,
                    child: Slider(
                      min: 0,
                      max: 250,
                      divisions: 50,
                      value: volume.toDouble(),
                      onChanged: setVolume,
                    ),
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
