import 'style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/launch/launch_cubit.dart';
import 'presentation/pages/launch_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Автобармен',
      theme: ThemeData(
        primarySwatch: Style.yellow,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Style.yellowAccent,
        ),
      ),
      home: BlocProvider<LaunchCubit>(
        create: (context) => LaunchCubit()..init(),
        child: const LaunchPage(),
      ),
    );
  }
}
