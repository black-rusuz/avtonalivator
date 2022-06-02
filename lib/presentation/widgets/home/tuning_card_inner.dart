import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home/home_bloc.dart';
import '../../../model/pump_model.dart';
import '../common/base_switch.dart';

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

  TextStyle get numberStyle => TextStyle(
        fontSize: 96,
        color: isEnabled
            ? Style.switchEnabled.withOpacity(0.1)
            : Style.switchDisabled.withOpacity(0.2),
      );

  TextStyle get textStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Style.switchEnabled,
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: isEnabled
            ? Style.switchEnabled.withOpacity(0.7)
            : Style.switchDisabled,
      );

  SliderThemeData sliderStyle(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        trackHeight: 5,
        activeTrackColor: isEnabled ? Style.switchEnabled : Style.yellow,
        inactiveTrackColor: isEnabled
            ? Colors.white.withOpacity(0.7)
            : const Color.fromRGBO(237, 237, 237, 1),
        thumbColor: isEnabled ? Style.switchEnabled : Style.yellow,
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
                  BaseSwitch(
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
