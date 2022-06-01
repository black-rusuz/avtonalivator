import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../model/pump_model.dart';

class TuningCardInner extends StatelessWidget {
  final int id;
  final String name;
  final double volume;
  final bool isEnabled;

  const TuningCardInner({
    Key? key,
    required this.id,
    required this.name,
    required this.volume,
    required this.isEnabled,
  }) : super(key: key);

  Color get black => const Color.fromRGBO(1, 0, 2, 1);

  Color get grey => const Color.fromRGBO(196, 196, 196, 1);

  TextStyle get numberStyle => TextStyle(
        fontSize: 96,
        color: isEnabled ? black.withOpacity(0.1) : grey.withOpacity(0.2),
      );

  TextStyle get textStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: black,
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: isEnabled ? black.withOpacity(0.7) : grey,
      );

  SliderThemeData sliderStyle(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        trackHeight: 5,
        activeTrackColor: isEnabled ? black : Style.yellow,
        inactiveTrackColor: isEnabled
            ? Colors.white.withOpacity(0.7)
            : const Color.fromRGBO(237, 237, 237, 1),
        thumbColor: isEnabled ? black : Style.yellow,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 5,
          elevation: 0,
          pressedElevation: 0,
        ),
        overlayColor: Colors.transparent,
        overlayShape: SliderComponentShape.noThumb,
      );

  void setVolume(BuildContext context, double value) => setPump(
        context,
        PumpModel(id: id, name: name, volume: value, isEnabled: isEnabled),
      );

  void setEnabled(BuildContext context, bool isEnabled) => setPump(
        context,
        PumpModel(id: id, name: name, volume: volume, isEnabled: isEnabled),
      );

  void setPump(BuildContext context, PumpModel pump) =>
      context.read<HomeBloc>().add(HomeSetPumpEvent(pump: pump));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -12,
          left: 10,
          child: Text(id.toString(), style: numberStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 16),
                child: Row(children: [
                  Text('Напиток', style: textStyle),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('${volume.round()}мл', style: volumeStyle),
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
                    value: isEnabled,
                    onToggle: (value) => setEnabled(context, value),
                  ),
                ]),
              ),
              Expanded(
                child: SliderTheme(
                  data: sliderStyle(context),
                  child: Slider(
                    min: 0,
                    max: 250,
                    divisions: 50,
                    value: volume,
                    onChanged: (value) => setVolume(context, value),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
