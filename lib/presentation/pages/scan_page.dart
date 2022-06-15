import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import '../../bloc/cocktails/cocktails_bloc.dart';
import '../../cubit/connect/connect_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../../cubit/tuning/tuning_cubit.dart';
import '../widgets/scan/scan_app_bar.dart';
import '../widgets/scan/scan_device_list.dart';
import 'home_page.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  MultiBlocProvider getHomeProvider([BluetoothConnection? connection]) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectCubit>(create: (_) => ConnectCubit(connection)),
        BlocProvider<TuningCubit>(create: (_) => TuningCubit()..init()),
        BlocProvider<CocktailsBloc>(
          create: (context) => CocktailsBloc()..add(CocktailsInitEvent()),
        ),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanConnection) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => getHomeProvider(state.connection),
            ),
          );
        } else if (state is ScanSkip) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => getHomeProvider(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Style.yellow,
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Пока пропустить'),
            icon: const Icon(Icons.skip_next_rounded),
            onPressed: () => context.read<ScanCubit>().skip(),
          ),
          body: RefreshIndicator(
            edgeOffset: 260 + 24,
            onRefresh: () => context.read<ScanCubit>().init(),
            child: CustomScrollView(
              slivers: [
                const ScanAppBar(),
                ScanDeviceList(
                  devices: state is ScanDevices ? state.devices : [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
