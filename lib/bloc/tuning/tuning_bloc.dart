import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tuning_event.dart';
part 'tuning_state.dart';

class TuningBloc extends Bloc<TuningEvent, TuningState> {
  TuningBloc() : super(TuningInitial()) {
    on<TuningEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
