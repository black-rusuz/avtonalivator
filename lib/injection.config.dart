// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connection/fbs_adapter.dart' as _i5;
import 'package:avtonalivator/data/data_source.dart' as _i12;
import 'package:avtonalivator/domain/connection/connector.dart' as _i11;
import 'package:avtonalivator/domain/connection/device_methods.dart' as _i13;
import 'package:avtonalivator/domain/repository/cocktails.dart' as _i15;
import 'package:avtonalivator/domain/repository/config.dart' as _i16;
import 'package:avtonalivator/domain/storage/commands.dart' as _i3;
import 'package:avtonalivator/domain/storage/settings.dart' as _i7;
import 'package:avtonalivator/domain/storage/stats.dart' as _i9;
import 'package:avtonalivator/injection.dart' as _i19;
import 'package:avtonalivator/presentation/fragments/cocktails/provider.dart'
    as _i18;
import 'package:avtonalivator/presentation/fragments/settings/provider.dart'
    as _i8;
import 'package:avtonalivator/presentation/fragments/tuning/provider.dart'
    as _i10;
import 'package:avtonalivator/presentation/pages/home/connection_provider.dart'
    as _i17;
import 'package:avtonalivator/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i6;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i14;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.CommandsBox>(() => _i3.CommandsBox());
    gh.singleton<_i4.Dio>(registerModule.dio);
    gh.singleton<_i5.FbsAdapter>(_i5.FbsAdapter());
    gh.factory<_i6.LaunchCubit>(() => _i6.LaunchCubit());
    gh.factory<_i7.SettingsBox>(() => _i7.SettingsBox());
    gh.factory<_i8.SettingsProvider>(
        () => _i8.SettingsProvider(gh<_i7.SettingsBox>()));
    gh.factory<_i9.StatsBox>(() => _i9.StatsBox());
    gh.factory<_i10.TuningProvider>(
        () => _i10.TuningProvider(gh<_i7.SettingsBox>()));
    gh.factory<_i11.Connector>(() => _i11.FbsConnector(gh<_i5.FbsAdapter>()));
    gh.factory<_i12.DataSource>(() => _i12.DataSource(gh<_i4.Dio>()));
    gh.factory<_i13.DeviceMethods>(
        () => _i13.FbsDeviceMethods(gh<_i5.FbsAdapter>()));
    gh.factory<_i14.ScanCubit>(() => _i14.ScanCubit(
          gh<_i7.SettingsBox>(),
          gh<_i11.Connector>(),
        ));
    gh.singleton<_i15.CocktailsRepository>(
        _i15.CocktailsRepository(gh<_i12.DataSource>()));
    gh.singleton<_i16.ConfigRepository>(
        _i16.ConfigRepository(gh<_i12.DataSource>()));
    gh.factory<_i17.ConnectionProvider>(() => _i17.ConnectionProvider(
          gh<_i13.DeviceMethods>(),
          gh<_i11.Connector>(),
        ));
    gh.factory<_i18.CocktailsProvider>(
        () => _i18.CocktailsProvider(gh<_i15.CocktailsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i19.RegisterModule {}
