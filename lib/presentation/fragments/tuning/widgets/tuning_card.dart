import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/pump.dart';
import '../../../strings.dart';
import '../../../widgets/animated_text.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';
import 'name_picker.dart';
import 'volume_dialog.dart';

const double _maxVolume = 250;
const _duration = Duration(milliseconds: 200);

class TuningCard extends StatelessWidget {
  final UiPump pump;
  final ValueChanged<UiPump> setPump;
  final List<String> drinks;

  const TuningCard({
    super.key,
    required this.pump,
    required this.setPump,
    required this.drinks,
  });

  // * Logic

  bool get isActive => pump.enabled;

  void setName(String name) {
    final newPump = pump.copyWith(name: name);
    return setPump(newPump);
  }

  void setVolume(double volume) {
    final newPump = pump.copyWith(volume: volume);
    return setPump(newPump);
  }

  void setEnabled(bool active) {
    final newPump = pump.copyWith(enabled: active);
    return setPump(newPump);
  }

  // * Modals

  void openNamePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NamePicker(
          drinks: drinks,
          setDrink: setName,
        );
      },
    );
  }

  void openVolumeField(BuildContext context) {
    final lastValue = pump.volume;
    showDialog(
      context: context,
      builder: (_) {
        return VolumeDialog(
          lastValue: lastValue,
          setVolume: setVolume,
        );
      },
    );
  }

  // * Presentation

  String get pickerTitle {
    return pump.name.isEmpty ? Strings.pickDrink : pump.name;
  }

  String get volume {
    return pump.volume.toStringAsFixed(0) + Strings.ml;
  }

  static final textStyle = AppTheme.text.copyWith(height: 1);

  TextStyle get numberStyle => TextStyle(
        fontSize: 100,
        height: 1,
        color: isActive
            ? AppTheme.black.withOpacity(0.1)
            : AppTheme.greyLight.withOpacity(0.2),
      );

  TextStyle get volumeStyle => textStyle.copyWith(
      color: isActive ? AppTheme.black.withOpacity(0.7) : AppTheme.greyLight);

  SliderThemeData sliderStyle(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      thumbColor: isActive ? AppTheme.black : AppTheme.accent,
      activeTrackColor: isActive ? AppTheme.black : AppTheme.accent,
      inactiveTrackColor:
          isActive ? AppTheme.background.withOpacity(0.7) : AppTheme.divider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      decoration: BoxDecoration(
        boxShadow: BasicCard.defaultShadow,
        color: isActive ? AppTheme.accent : AppTheme.background,
        borderRadius: BorderRadius.circular(30),
        // TODO: borderRadius
        // borderRadius: AppTheme.borderRadius,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 8,
            left: 14,
            right: null,
            child: Center(
              child: AnimatedText(
                pump.id.toString(),
                duration: _duration,
                style: numberStyle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: BasicCard(
                          onTap: () => openNamePicker(context),
                          height: 50,
                          padding: const EdgeInsets.only(left: 50, right: 15),
                          alignment: Alignment.centerLeft,
                          child: AnimatedText(
                            pickerTitle,
                            duration: _duration,
                            style: textStyle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      BasicCard(
                        onTap: () => openVolumeField(context),
                        height: 50,
                        padding: AppTheme.horizontalPadding,
                        alignment: Alignment.centerLeft,
                        child: AnimatedText(
                          volume,
                          duration: _duration,
                          style: volumeStyle,
                        ),
                      ),
                      BasicSwitch(
                        value: isActive,
                        onChanged: setEnabled,
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: sliderStyle(context),
                  child: SizedBox(
                    height: 40,
                    child: Slider(
                      min: 0,
                      max: max(pump.volume, _maxVolume),
                      divisions: 50,
                      value: pump.volume,
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
