import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/model/param.dart';
import '../../../../domain/storage/settings.dart';

part 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  final SettingsBox _settings;

  SettingsCubit(this._settings) : super(SettingsInitial()) {
    emit(_fullState);
  }

  void setParam<T>(String key, T value) {
    _settings.setParam<T>(key, value);
    emit(_fullState);
  }

  SettingsFulfilled get _fullState =>
      SettingsFulfilled(params: _settings.params);
}
