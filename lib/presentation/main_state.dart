part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainStatus extends MainState {
  final bool isAvailable;
  final bool isEnabled;

  const MainStatus({required this.isAvailable, required this.isEnabled});

  @override
  List<Object> get props => [isAvailable, isEnabled];
}
