import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router.dart';
import 'cubit/start_cubit.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<StartCubit, StartState>(
        listenWhen: (prev, next) => next is StartFulfilled,
        listener: listener,
        builder: builder,
      ),
    );
  }

  void listener(BuildContext context, StartState state) {
    if (state is StartFulfilled && state.btEnabled) {
      Navigator.of(context).pushNamed(AppRoutes.connect);
    }
  }

  Widget builder(BuildContext context, StartState state) {
    if (state is StartAnimate) {
      return const SizedBox();
    } else if (state is StartFulfilled) {
      return const SizedBox();
    } else {
      return const SizedBox();
    }
  }
}
