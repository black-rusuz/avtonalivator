import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/launch/launch_cubit.dart';

class LaunchStatusPage extends StatelessWidget {
  final bool isAvailable;
  final bool isEnabled;

  const LaunchStatusPage({
    Key? key,
    required this.isAvailable,
    required this.isEnabled,
  }) : super(key: key);

  void requestEnable(BuildContext context) =>
      context.read<LaunchCubit>().requestEnable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !isAvailable
            ? Text('Bluetooth не поддерживается устройством', style: Style.text)
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Text('Вы не включили Bluetooth', style: Style.text),
                  ),
                  TextButton(
                    onPressed: () => requestEnable(context),
                    child: const Text('Включить Bluetooth'),
                    style: TextButton.styleFrom(
                      primary: Style.black,
                      backgroundColor: Style.yellow,
                      minimumSize: const Size(0, 60),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
