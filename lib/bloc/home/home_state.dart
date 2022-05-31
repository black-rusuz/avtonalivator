part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();

  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}
