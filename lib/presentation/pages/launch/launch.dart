import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/theme.dart';
import '../../../core/router.dart';
import '../../assets_image.dart';
import '../../strings.dart';
import '../../widgets/animated_text.dart';
import '../../widgets/basic_image.dart';
import 'cubit/launch_cubit.dart';

part 'widgets/animation.dart';
part 'widgets/status.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LaunchCubit, LaunchState>(
        listenWhen: (prev, next) => next is LaunchGoScan,
        listener: listener,
        buildWhen: (prev, next) => next is! LaunchGoScan,
        builder: builder,
      ),
    );
  }

  void listener(BuildContext context, LaunchState state) {
    if (state is LaunchGoScan) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
    }
  }

  Widget builder(BuildContext context, LaunchState state) {
    if (state is LaunchStatus) {
      return LaunchBody(
        noPermission: state.noPermission,
        notAvailable: state.notAvailable,
        notEnabled: !state.enabled,
      );
    } else {
      return LaunchAnimation(animate: state is LaunchAnimate);
    }
  }
}
