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
import 'cubit/start_cubit.dart';

part 'widgets/animation.dart';
part 'widgets/status.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StartCubit, StartState>(
        listenWhen: (prev, next) => next is StartGoScan,
        listener: listener,
        buildWhen: (prev, next) => next is !StartGoScan,
        builder: builder,
      ),
    );
  }

  void listener(BuildContext context, StartState state) {
    if (state is StartGoScan) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
    }
  }

  Widget builder(BuildContext context, StartState state) {
    if (state is StartStatus) {
      return StartBody(
        noPermission: state.noPermission,
        notAvailable: state.notAvailable,
        notEnabled: !state.enabled,
      );
    } else {
      return StartAnimation(animate: state is StartAnimate);
    }
  }
}
