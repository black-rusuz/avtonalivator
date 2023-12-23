import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/drink.dart';
import '../../../strings.dart';
import '../../../widgets/animated_text.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';
import 'name_picker.dart';
import 'volume_dialog.dart';

const _maxVolume = 500.0;
const _duration = AppTheme.duration;

class TuningCard extends StatelessWidget {
  final UiDrink drink;
  final ValueChanged<UiDrink> setDrink;
  final VoidCallback onDrinkSet;
  final List<String> drinks;

  const TuningCard({
    super.key,
    required this.drink,
    required this.setDrink,
    required this.onDrinkSet,
    required this.drinks,
  });

  // * Logic

  bool get isActive => drink.enabled;

  void setName(String name) {
    onDrinkSet();
    final newDrink = drink.copyWith(name: name);
    return setDrink(newDrink);
  }

  void setVolume(double volume) {
    final newDrink = drink.copyWith(volume: volume);
    return setDrink(newDrink);
  }

  void setEnabled(bool active) {
    final newDrink = drink.copyWith(enabled: active);
    return setDrink(newDrink);
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
    final lastValue = drink.volume;
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
    return drink.name.isEmpty ? Strings.pickDrink : drink.name;
  }

  String get volume {
    return drink.volume.toStringAsFixed(0) + Strings.ml;
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
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 8,
            left: 14,
            right: null,
            child: Center(
              child: AnimatedText(
                drink.id.toString(),
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
                      max: max(drink.volume, _maxVolume),
                      divisions: 50,
                      value: drink.volume,
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
