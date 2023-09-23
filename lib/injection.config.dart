// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connector.dart' as _i3;
import 'package:avtonalivator/data/data_source.dart' as _i8;
import 'package:avtonalivator/domain/repository/cocktails_repository.dart'
    as _i10;
import 'package:avtonalivator/domain/repository/config_repository.dart' as _i11;
import 'package:avtonalivator/domain/storage/settings.dart' as _i6;
import 'package:avtonalivator/domain/storage/stats.dart' as _i7;
import 'package:avtonalivator/injection.dart' as _i14;
import 'package:avtonalivator/presentation/fragments/cocktails/provider.dart'
    as _i13;
import 'package:avtonalivator/presentation/fragments/tuning/bloc/tuning_bloc.dart'
    as _i12;
import 'package:avtonalivator/presentation/pages/launch/cubit/launch_cubit.dart'
    as _i5;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i9;
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
    gh.singleton<_i3.Connector>(_i3.Connector());
    gh.singleton<_i4.Dio>(registerModule.dio);
    gh.factory<_i5.LaunchCubit>(() => _i5.LaunchCubit());
    gh.factory<_i6.SettingsBox>(() => _i6.SettingsBox());
    gh.factory<_i7.StatsBox>(() => _i7.StatsBox());
    gh.factory<_i8.DataSource>(() => _i8.DataSource(gh<_i4.Dio>()));
    gh.factory<_i9.ScanCubit>(() => _i9.ScanCubit(
          gh<_i6.SettingsBox>(),
          gh<_i3.Connector>(),
        ));
    gh.singleton<_i10.CocktailsRepository>(
        _i10.CocktailsRepository(gh<_i8.DataSource>()));
    gh.singleton<_i11.ConfigRepository>(
        _i11.ConfigRepository(gh<_i8.DataSource>()));
    gh.factory<_i12.TuningBloc>(
        () => _i12.TuningBloc(gh<_i11.ConfigRepository>()));
    gh.factory<_i13.CocktailsProvider>(
        () => _i13.CocktailsProvider(gh<_i10.CocktailsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
