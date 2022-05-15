import 'package:avtonalivator/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/scan/scan_bloc.dart';
import '../widgets/scan/scan_appbar.dart';
import '../widgets/scan/device_list.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  void pushHomePage(BuildContext context, ScanState state) {
    if (false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  Widget buildPage(BuildContext context, ScanState state) => Scaffold(
      body: state is ScanDevicesFetchedState
          ? CustomScrollView(
              slivers: [
                const ScanAppBar(),
                DeviceList(devices: state.devices),
              ],
            )
          : const CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScanBloc>(
      create: (_) => ScanBloc()..add(ScanInitialEvent()),
      child: BlocListener<ScanBloc, ScanState>(
        listener: pushHomePage,
        child: BlocBuilder<ScanBloc, ScanState>(
          builder: buildPage,
        ),
      ),
    );
  }
}
