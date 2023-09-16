import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        listenWhen: (prev, next) => next is StartFulfilled,
        listener: listener,
        buildWhen: (prev, next) => !(next is StartFulfilled && next.btEnabled),
        builder: builder,
      ),
    );
  }

  void listener(BuildContext context, StartState state) {
    if (state is StartFulfilled && state.btEnabled) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.scan);
    }
  }

  Widget builder(BuildContext context, StartState state) {
    if (state is StartFulfilled) {
      return StartStatus(
        btAvailable: state.btAvailable,
        btEnabled: state.btEnabled,
      );
    } else {
      return StartAnimation(animate: state is StartAnimate);
    }
  }
}
