import 'package:avtonalivator/presentation/widgets/connection/connection_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/launch/launch_bloc.dart';
import '../widgets/connection/device_list.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  void requestEnable(BuildContext context) =>
      context.read<LaunchBloc>()..add(LaunchInitialEvent());

  @override
  Widget build(BuildContext context) {
    final devs = [
      'Yandex.Mini',
      'JBL E40BT',
      'Razer Barracuda X',
      'Avtobarmen',
      'Yandex.Mini',
      'JBL E40BT',
      'Razer Barracuda X',
      'Avtobarmen',
      'Yandex.Mini',
      'JBL E40BT',
      'Razer Barracuda X',
      'Avtobarmen',
    ];

    return BlocBuilder<LaunchBloc, LaunchState>(
      builder: (context, state) => Scaffold(
        body: state is! LaunchStatusFetchedState
            ? const Center(child: CircularProgressIndicator())
            : !state.isAvailable
                ? const Center(
                    child: Text('Bluetooth is not supported by your device'))
                : !state.isEnabled
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Bluetooth is not enabled'),
                            TextButton(
                                onPressed: () => requestEnable(context),
                                child: const Text('Enable Bluetooth')),
                          ],
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          const ConnectionAppBar(),
                          DeviceList(devices: devs),
                        ],
                      ),
      ),
    );
  }
}
