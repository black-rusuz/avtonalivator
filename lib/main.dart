import 'package:avtonalivator/presentation/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainStatus) {
            if (!state.isAvailable) {
              return const Text("Bluetooth is not available");
            }
            if (!state.isEnabled) {
              return const Text("Bluetooth is not enabled");
            } else {
              return const Text("Select device");
            }
          }
          return const SizedBox();
        },
      ),
    );
    return const SizedBox();
  }
}
