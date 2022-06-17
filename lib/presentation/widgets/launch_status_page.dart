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
            ? const Text('Bluetooth не поддерживается устройством')
            : Column(
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
                      onPrimary: Style.black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
