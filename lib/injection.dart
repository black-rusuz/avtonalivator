import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final get = GetIt.instance;

@injectableInit
Future<void> initServices({String? env}) async => get.init(environment: env);

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}
