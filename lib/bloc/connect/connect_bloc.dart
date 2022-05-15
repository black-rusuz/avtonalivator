import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connect_event.dart';

part 'connect_state.dart';

class ConnectBloc extends Bloc<ConnectEvent, ConnectState> {
  ConnectBloc() : super(ConnectInitialState()) {
    on<ConnectInitialEvent>(_init);
  }

  FutureOr<void> _init(
    ConnectInitialEvent event,
    Emitter<ConnectState> emit,
  ) async {}
}
