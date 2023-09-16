// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:avtonalivator/data/connector.dart' as _i3;
import 'package:avtonalivator/data/data_source.dart' as _i4;
import 'package:avtonalivator/domain/repository/cocktails_repository.dart'
    as _i7;
import 'package:avtonalivator/domain/repository/config_repository.dart' as _i8;
import 'package:avtonalivator/presentation/pages/scan/cubit/scan_cubit.dart'
    as _i5;
import 'package:avtonalivator/presentation/pages/start/cubit/start_cubit.dart'
    as _i6;
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
    gh.singleton<_i3.Connector>(_i3.Connector());
    gh.factory<_i4.DataSource>(() => _i4.DataSource(gh<dynamic>()));
    gh.factory<_i5.ScanCubit>(() => _i5.ScanCubit());
    gh.factory<_i6.StartCubit>(() => _i6.StartCubit());
    gh.singleton<_i7.CocktailsRepository>(
        _i7.CocktailsRepository(gh<_i4.DataSource>()));
    gh.singleton<_i8.ConfigRepository>(
        _i8.ConfigRepository(gh<_i4.DataSource>()));
    return this;
  }
}
