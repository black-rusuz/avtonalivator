import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/launch/launch_bloc.dart';
import 'scan_page.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  void requestEnable(BuildContext context) =>
      context.read<LaunchBloc>().add(LaunchInitialEvent());

  void pushScanPage(BuildContext context, LaunchState state) {
    if (state is LaunchStatusFetchedState && state.isEnabled) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ScanPage()),
      );
    }
  }

  Widget buildScreen(context, state) => Scaffold(
        body: Center(
          child: state is! LaunchStatusFetchedState
              ? const CircularProgressIndicator()
              : !state.isAvailable
                  ? const Text('Bluetooth is not supported by your device')
                  : !state.isEnabled
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Bluetooth is not enabled'),
                            TextButton(
                                onPressed: () => requestEnable(context),
                                child: const Text('Enable Bluetooth')),
                          ],
                        )
                      : const CircularProgressIndicator(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchBloc>(
      create: (_) => LaunchBloc()..add(LaunchInitialEvent()),
      child: BlocListener<LaunchBloc, LaunchState>(
        listener: pushScanPage,
        child: BlocBuilder<LaunchBloc, LaunchState>(
          builder: buildScreen,
        ),
      ),
    );
  }
}
