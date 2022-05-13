import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'status_cubit.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatusCubit>(
      create: (_) => StatusCubit(),
      child: BlocBuilder<StatusCubit, StatusState>(
        builder: (context, state) {
          // TODO: красивый экран, включающий бт
          if (state is StatusSuccessState) {
            if (!state.isAvailable) {
              return const Text("Bluetooth is not available");
            }
            if (!state.isEnabled) {
              return const Text("Bluetooth is not enabled");
            } else {
              return const Text("Select device");
            }
          }
          // пуш без возврата на прошлый экран
          return TextButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/test'),
            child: const Text("test"),
          );
        },
      ),
    );
  }
}
