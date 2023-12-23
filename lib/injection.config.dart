// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connection/fbs_adapter.dart' as _i5;
import 'package:avtonalivator/data/data_source.dart' as _i13;
import 'package:avtonalivator/data/local_cocktails.dart' as _i7;
import 'package:avtonalivator/domain/connection/connector.dart' as _i12;
import 'package:avtonalivator/domain/connection/device_methods.dart' as _i14;
import 'package:avtonalivator/domain/repository/cocktails.dart' as _i16;
import 'package:avtonalivator/domain/repository/config.dart' as _i17;
import 'package:avtonalivator/domain/storage/commands.dart' as _i3;
import 'package:avtonalivator/domain/storage/settings.dart' as _i8;
import 'package:avtonalivator/domain/storage/stats.dart' as _i10;
import 'package:avtonalivator/injection.dart' as _i20;
import 'package:avtonalivator/presentation/fragments/cocktails/provider.dart'
    as _i19;
import 'package:avtonalivator/presentation/fragments/settings/provider.dart'
    as _i9;
import 'package:avtonalivator/presentation/fragments/tuning/provider.dart'
    as _i11;
import 'package:avtonalivator/presentation/pages/home/connection_provider.dart'
    as _i18;
import 'package:avtonalivator/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i6;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i15;
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
    gh.singleton<_i7.LocalCocktails>(_i7.LocalCocktails());
    gh.factory<_i8.SettingsBox>(() => _i8.SettingsBox());
    gh.factory<_i9.SettingsProvider>(
        () => _i9.SettingsProvider(gh<_i8.SettingsBox>()));
    gh.factory<_i10.StatsBox>(() => _i10.StatsBox());
    gh.factory<_i11.TuningProvider>(
        () => _i11.TuningProvider(gh<_i8.SettingsBox>()));
    gh.factory<_i12.Connector>(() => _i12.FbsConnector(gh<_i5.FbsAdapter>()));
    gh.factory<_i13.DataSource>(() => _i13.DataSource(gh<_i4.Dio>()));
    gh.factory<_i14.DeviceMethods>(
        () => _i14.FbsDeviceMethods(gh<_i5.FbsAdapter>()));
    gh.factory<_i15.ScanCubit>(() => _i15.ScanCubit(
          gh<_i8.SettingsBox>(),
          gh<_i12.Connector>(),
        ));
    gh.singleton<_i16.CocktailsRepository>(
        _i16.CocktailsRepository(gh<_i13.DataSource>()));
    gh.singleton<_i17.ConfigRepository>(
        _i17.ConfigRepository(gh<_i13.DataSource>()));
    gh.factory<_i18.ConnectionProvider>(() => _i18.ConnectionProvider(
          gh<_i14.DeviceMethods>(),
          gh<_i12.Connector>(),
        ));
    gh.factory<_i19.CocktailsProvider>(
        () => _i19.CocktailsProvider(gh<_i16.CocktailsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}
