import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../domain/model/pump.dart';
import '../../../widgets/basic_switch.dart';

const _duration = Duration(seconds: 1);

class TuningCard extends StatelessWidget {
  final UiPump pump;

  const TuningCard({super.key, required this.pump});

  bool get isActive => pump.isEnabled;

  static const textStyle = TextStyle(
    fontSize: 14,
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
      child: InkWell(
        // TODO: openName or disable
        onTap: () {},
        borderRadius: AppTheme.borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: isActive ? AppTheme.accent : AppTheme.white,
            borderRadius: AppTheme.borderRadius,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                left: 10,
                right: null,
                child: Center(
                  child: Text(
                    pump.id.toString(),
                    style: numberStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          // TODO: openName
                          // onPressed: () => openPicker(context),
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                            minimumSize: const Size(0, 25),
                            maximumSize: const Size.fromHeight(25),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            children: [
                              Text(pump.name, style: textStyle),
                              const SizedBox(width: 8),
                              Text('25мл', style: volumeStyle),
                            ],
                          ),
                        ),
                        BasicSwitch(
                          value: isActive,
                          onChanged: (value) {},
                          // TODO: disable
                          // onChanged: (value) => setEnabled(context, value),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: sliderStyle(context),
                      child: SizedBox(
                        height: 35,
                        child: Slider(
                          min: 0,
                          max: 250,
                          divisions: 50,
                          value: 25,
                          onChanged: (value) {},
                          // TODO: setVolume
                          // onChanged: (value) => setVolume(context, value),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
