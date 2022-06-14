import 'package:avtonalivator/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/launch/launch_cubit.dart';
import 'presentation/pages/launch_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автобармен',
      theme: ThemeData(primarySwatch: Style.yellow),
      home: BlocProvider<LaunchCubit>(
        create: (context) => LaunchCubit()..init(),
        child: const LaunchPage(),
      ),
    );
  }
}
