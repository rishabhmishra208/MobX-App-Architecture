import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Services/services_export.dart';
import '../Constants/constants_export.dart';
import '../Controllers/controllers_export.dart';
import '../Common_Function/app_localization_extension.dart';

class AuthInterceptor extends Interceptor {
  final AuthController authController;

  AuthInterceptor(this.authController);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.followRedirects = false;
    options.headers['x-lang'] = 'en';
    options.headers['validateStatus'] = true;
    options.headers['session_token'] = SharedPrefService.getSessionToken();

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String? message = err.response?.data?['message'] ?? '';

    final customError = {
      'message': message.isNotNullOrEmpty
          ? message
          : globalNavigatorKey.currentContext?.localization.serverErrorMessage,
    };

    // Create a new DioException with the custom error
    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: customError,
    );

    if (err.response?.statusCode == 401) {
      // authController.logout();

      Modular.to.pushNamedAndRemoveUntil(
        Routes.homeScreen,
        (Route route) => false,
      );
    }

    super.onError(newError, handler);
  }
}
