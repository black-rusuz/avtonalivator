import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/connector.dart';

part 'connection_state.dart';

@injectable
class ConnectionCubit extends Cubit<ConnectionState> {
  final Connector _connector;

  ConnectionCubit(this._connector) : super(ConnectionInitial());

  void disconnect() {
    _connector.disconnect();
  }
}
