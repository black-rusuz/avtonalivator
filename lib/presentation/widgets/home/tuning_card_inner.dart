import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../../../cubit/tuning/tuning_cubit.dart';
import '../../../model/pump_model.dart';
import '../common/base_switch.dart';

class TuningCardInner extends StatelessWidget {
  final PumpModel pump;

  const TuningCardInner({Key? key, required this.pump}) : super(key: key);

  TextStyle get numberStyle => TextStyle(
        fontSize: 96,
        color: pump.isEnabled
            ? Style.black.withOpacity(0.1)
            : Style.greyLight.withOpacity(0.2),
      );

  TextStyle get textStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Style.black,
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: pump.isEnabled ? Style.black.withOpacity(0.7) : Style.greyLight,
      );

  SliderThemeData sliderStyle(BuildContext context) =>
      SliderTheme.of(context).copyWith(
        trackHeight: 5,
        activeTrackColor: pump.isEnabled ? Style.black : Style.yellow,
        inactiveTrackColor: pump.isEnabled
            ? Style.yellowAccent.withOpacity(0.7)
            : Style.greyDivider,
        thumbColor: pump.isEnabled ? Style.black : Style.yellow,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 5,
          elevation: 0,
          pressedElevation: 0,
        ),
        overlayShape: SliderComponentShape.noOverlay,
      );

  void setVolume(BuildContext context, double value) =>
      setPump(context, pump.copyWith(volume: value));

  void setEnabled(BuildContext context, bool isEnabled) =>
      setPump(context, pump.copyWith(isEnabled: isEnabled));

  void setPump(BuildContext context, PumpModel pump) {
    context.read<TuningCubit>().setPump(pump);
    context.read<ConnectCubit>().sendRefresh(pump);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -12,
          left: 10,
          child: Text(pump.id.toString(), style: numberStyle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Text('Напиток', style: textStyle),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child:
                          Text('${pump.volume.round()}мл', style: volumeStyle),
                    ),
                    const Expanded(child: SizedBox()),
                    BaseSwitch(
                      value: pump.isEnabled,
                      onToggle: (value) => setEnabled(context, value),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: SliderTheme(
                  data: sliderStyle(context),
                  child: Slider(
                    min: 0,
                    max: 250,
                    divisions: 50,
                    value: pump.volume,
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
