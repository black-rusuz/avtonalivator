import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  Stream<bool> get isDiscovering => const Stream.empty();

  void scan() {}
}
