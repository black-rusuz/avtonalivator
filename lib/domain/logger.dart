import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Logger {
  static Function(dynamic, [Object?, StackTrace?]) get log =>
      kDebugMode ? _logDebug : _logProd;

  static void _logDebug(
    dynamic message, [
    Object? error,
    StackTrace? stack,
  ]) {
    if (kDebugMode) print(message);
    if (stack != null || error != null) {
      debugPrintStack(stackTrace: stack, label: error.toString());
    }
  }

  static void _logProd(dynamic message, [Object? error, StackTrace? stack]) {
    final crashlytics = FirebaseCrashlytics.instance;
    crashlytics.log(message);
    if (stack != null || error != null) crashlytics.recordError(error, stack);
  }
}
