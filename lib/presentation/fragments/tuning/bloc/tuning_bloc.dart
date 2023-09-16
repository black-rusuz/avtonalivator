import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'tuning_event.dart';
part 'tuning_state.dart';

@injectable
class TuningBloc extends Bloc<TuningEvent, TuningState> {
  TuningBloc() : super(TuningInitial());
}
