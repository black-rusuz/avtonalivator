import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/scan/scan_bloc.dart';
import '../widgets/scan/scan_appbar.dart';
import '../widgets/scan/scan_device_list.dart';
import 'home_page.dart';

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
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Style.yellow,
            body: state is ScanDevicesFetchedState
                ? CustomScrollView(
                    slivers: [
                      const ScanAppBar(),
                      ScanDeviceList(devices: state.devices),
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
