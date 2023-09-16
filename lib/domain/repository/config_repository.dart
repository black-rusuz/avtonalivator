import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/config.dart';
import '../../data/data_source.dart';

@singleton
class ConfigRepository {
  final DataSource _source;

  ConfigRepository(this._source) {
    getConfig().then(_config.add);
  }

  final _config = BehaviorSubject<AppConfig>.seeded(AppConfig());

  AppConfig get value => _config.value;

  Stream<AppConfig> get stream => _config;

  Future<AppConfig> getConfig() async {
    final config = await _source.getConfig();
    final result = AppConfig.fromApi(config);
    return result;
  }
}
