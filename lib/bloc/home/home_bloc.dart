import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) => _init);
    on<HomeConnectedEvent>((event, emit) => _connect);
  }

  FutureOr<void> _init(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {}

  FutureOr<void> _connect(
    HomeConnectedEvent event,
    Emitter<HomeState> emit,
  ) async {}
}
