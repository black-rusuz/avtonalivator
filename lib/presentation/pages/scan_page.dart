import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cocktails/cocktails_cubit.dart';
import '../../cubit/connect/connect_cubit.dart';
import '../../cubit/scan/scan_cubit.dart';
import '../../cubit/tuning/tuning_cubit.dart';
import '../widgets/common/scan_device_list.dart';
import '../widgets/home/scan_app_bar.dart';
import 'home_page.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  MultiBlocProvider getHomeProvider([ConnectArgs? args]) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectCubit>(create: (_) => ConnectCubit(args)..init()),
        BlocProvider<TuningCubit>(create: (_) => TuningCubit()..init()),
        BlocProvider<CocktailsCubit>(create: (_) => CocktailsCubit()..init()),
        BlocProvider<ScanCubit>(create: (context) => ScanCubit()),
      ],
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanConnected) {
          ConnectArgs args = ConnectArgs(
            connection: state.connection,
            name: state.name,
            address: state.address,
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => getHomeProvider(args)));
        }
        if (state is ScanSkipped) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => getHomeProvider()));
        }
      },
      buildWhen: ((prev, next) => next is ScanDevices),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Style.yellow,
          floatingActionButton: FloatingActionButton.extended(
            label: const Text('Пока пропустить'),
            icon: const Icon(Icons.skip_next_rounded),
            onPressed: () => context.read<ScanCubit>().skip(),
          ),
          body: RefreshIndicator(
            edgeOffset: MediaQuery.of(context).viewPadding.top + 260,
            onRefresh: () async => context.read<ScanCubit>().scan(),
            child: CustomScrollView(
              slivers: [
                const ScanAppBar(),
                SliverToBoxAdapter(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).viewPadding.top + 260),
                    ),
                    decoration: const BoxDecoration(
                      color: Style.yellowAccent,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: ScanDeviceList(
                      devices: state is ScanDevices ? state.devices : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
