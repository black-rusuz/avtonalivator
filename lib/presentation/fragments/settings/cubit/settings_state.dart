part of 'settings_cubit.dart';

@immutable
abstract class SettingsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsFulfilled extends SettingsState {
  final List<Param> params;

  SettingsFulfilled({required this.params});

  @override
  List<Object?> get props => [
        [...params],
      ];
}
