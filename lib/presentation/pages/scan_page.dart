import 'package:avtonalivator/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/scan/scan_bloc.dart';
import '../widgets/scan/device_list.dart';
import '../widgets/scan/scan_appbar.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScanBloc>(
      create: (context) => ScanBloc()..add(ScanInitialEvent()),
      child: BlocConsumer<ScanBloc, ScanState>(
        listener: (context, state) {
          if (state is ScanDeviceConnectedState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(connection: state.connection),
              ),
            );
          }
        },
        builder: (context, state) => Scaffold(
            body: state is ScanDevicesFetchedState
                ? CustomScrollView(
                    slivers: [
                      const ScanAppBar(),
                      DeviceList(devices: state.devices),
                    ],
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }
}
