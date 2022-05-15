import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/connect/connect_bloc.dart';
import '../widgets/connect/connect_appbar.dart';
import '../widgets/connect/device_list.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectBloc>(
      create: (_) => ConnectBloc()..add(ConnectInitialEvent()),
      child: BlocListener<ConnectBloc, ConnectState>(
        listener: (context, state) {},
        child: BlocBuilder<ConnectBloc, ConnectState>(
          builder: (context, state) {
            return const Scaffold(
              body: CustomScrollView(
                slivers: [
                  ConnectAppBar(),
                  DeviceList(devices: []),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
