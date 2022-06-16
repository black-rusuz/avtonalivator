import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/launch/launch_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../widgets/common/center_wrapper.dart';
import 'scan_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  final Duration duration = const Duration(milliseconds: 750);

  void requestEnable(BuildContext context) =>
      context.read<LaunchCubit>().requestEnable();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchCubit, LaunchState>(
      listener: (context, state) {
        if (state is LaunchStatus && state.isEnabled) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<ScanCubit>(
                create: (context) => ScanCubit()..init(),
                child: const ScanPage(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LaunchStatus) {
          return CenterWrapper(
            child: !state.isAvailable
                ? const Text('Bluetooth не поддерживается устройством')
                : !state.isEnabled
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 100),
                            child: Text('Вы не включили Bluetooth'),
                          ),
                          TextButton(
                            onPressed: () => requestEnable(context),
                            child: const Text('Включить Bluetooth'),
                            style: ElevatedButton.styleFrom(
                              primary: Style.yellow,
                              onPrimary: Style.switchEnabled,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
          );
        }
        return CenterWrapper(
          colored: true,
          child: Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.easeOutCubic,
                duration: duration,
                top: state is LaunchInitial ? 100 : 170,
                left: 87.5,
                child: Column(
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: duration,
                      child: Text(
                        'Автобармен',
                        style: Style.launchHeader,
                      ),
                      style: TextStyle(
                        color: state is LaunchInitial
                            ? Colors.transparent
                            : Colors.black,
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      duration: duration,
                      child: Text(
                        'Система автоналива напитков',
                        style: Style.launchSubheader,
                      ),
                      style: TextStyle(
                        color: state is LaunchInitial
                            ? Colors.transparent
                            : Colors.black,
                      ),
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
                      top: state is LaunchInitial ? 29 : 52,
                      left: 87.5,
                      child: const Text(
                        '•',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
