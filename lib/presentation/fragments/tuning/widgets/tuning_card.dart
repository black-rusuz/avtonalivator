import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/pump.dart';
import '../../../widgets/animated_text.dart';
import '../../../widgets/basic_card.dart';
import '../../../widgets/basic_switch.dart';

const _duration = Duration(milliseconds: 200);

class TuningCard extends StatelessWidget {
  final UiPump pump;
  final ValueChanged<UiPump> setPump;

  const TuningCard({super.key, required this.pump, required this.setPump});

  // * Logic

  bool get isActive => pump.isEnabled;

  void setEnabled(bool active) {
    final newPump = pump.copyWith(isEnabled: active);
    return setPump(newPump);
  }

  void setVolume(double volume) {
    final newPump = pump.copyWith(volume: volume);
    return setPump(newPump);
  }

  // * Presentation

  static const textStyle = TextStyle(
    fontSize: 14,
    height: 1,
    fontWeight: FontWeight.w500,
    color: AppTheme.black,
  );

  TextStyle get numberStyle => TextStyle(
        fontSize: 100,
        height: 1,
        color: isActive
            ? AppTheme.black.withOpacity(0.1)
            : AppTheme.greyLight.withOpacity(0.2),
      );

  TextStyle get volumeStyle => TextStyle(
        fontSize: 14,
        height: 1,
        fontWeight: FontWeight.w500,
        color: isActive ? AppTheme.black.withOpacity(0.7) : AppTheme.greyLight,
      );

  SliderThemeData sliderStyle(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      thumbColor: isActive ? AppTheme.black : AppTheme.accent,
      activeTrackColor: isActive ? AppTheme.black : AppTheme.accent,
      inactiveTrackColor:
          isActive ? AppTheme.white.withOpacity(0.7) : AppTheme.greyDivider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.accent : AppTheme.white,
        borderRadius: BorderRadius.circular(30),
        // TODO: borderRadius
        // borderRadius: AppTheme.borderRadius,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            left: 10,
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
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: BasicCard(
                          // TODO: open setName
                          // onPressed: () => openPicker(context),
                          onTap: () {},
                          height: 50,
                          padding: const EdgeInsets.only(left: 50, right: 30),
                          alignment: Alignment.centerLeft,
                          child: AnimatedText(
                            pump.name,
                            duration: _duration,
                            style: textStyle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      BasicCard(
                        // TODO: open setVolume
                        // onPressed: () => openPicker(context),
                        onTap: () {},
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerLeft,
                        child: AnimatedText(
                          '${pump.volume.toStringAsFixed(0)}мл',
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
                      max: 250,
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
