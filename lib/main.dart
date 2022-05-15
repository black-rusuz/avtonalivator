import 'package:avtonalivator/presentation/pages/launch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/launch/launch_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автобармен',
      theme: ThemeData(primarySwatch: Colors.green),
      home: BlocProvider<LaunchBloc>(
        create: (_) => LaunchBloc()..add(LaunchInitialEvent()),
        child: const LaunchPage(),
      ),
    );
  }
}
