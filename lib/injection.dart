import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final get = GetIt.instance;

@injectableInit
GetIt initServices({String? env}) => get.init(environment: env);

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}
