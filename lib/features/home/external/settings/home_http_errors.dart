import 'package:dio/dio.dart';

import '../../../../global/utils/app_utils.dart';

enum HomeHttpErrors {
  nullData,
  invalidData,
  notFound,
  serverError,
  failedRequest,
  unexpectedError;

  String get message {
    return AppFailureMessage.get(code);
  }

  static HomeHttpErrors fromDio(DioException e) {
    switch (e.response?.statusCode) {
      case 404:
        return HomeHttpErrors.notFound;
      case 500:
      case 501:
      case 502:
      case 503:
        return HomeHttpErrors.serverError;
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return HomeHttpErrors.failedRequest;
    }

    return HomeHttpErrors.unexpectedError;
  }

  String get code => 'home${name.capitalize()}';
}
