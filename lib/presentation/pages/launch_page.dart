import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/launch/launch_bloc.dart';
import '../../bloc/scan/scan_bloc.dart';
import 'scan_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  void requestEnable(BuildContext context) =>
      context.read<LaunchBloc>().add(LaunchInitialEvent());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaunchBloc, LaunchState>(
      listener: (context, state) {
        if (state is LaunchStatusFetchedState && state.isEnabled) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<ScanBloc>(
                create: (context) => ScanBloc()..add(ScanInitialEvent()),
                child: const ScanPage(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: state is! LaunchStatusFetchedState
                ? const CircularProgressIndicator()
                : !state.isAvailable
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
                                  onPrimary: Colors.black,
                                ),
                              ),
                            ],
                          )
                        : const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
