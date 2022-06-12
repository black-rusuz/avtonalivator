import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/connect/connect_cubit.dart';
import '../../widgets/common/base_app_bar.dart';

class StatsFragment extends StatelessWidget {
  const StatsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BaseAppBar(title: 'Статистика'),
        SliverToBoxAdapter(
          child: BlocBuilder<ConnectCubit, ConnectState>(
            builder: (context, state) {
              return Text('Connected: ' +
                  context.watch<ConnectCubit>().isConnected.toString());
            },
          ),
        ),
      ],
    );
  }
}
