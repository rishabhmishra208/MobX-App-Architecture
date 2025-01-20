import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Constants/constants_export.dart';
import '../Popup_Handlers/popup_handlers_export.dart';
import '../Common_Function/comman_functions_export.dart';

class InitApiUtils {
  String userId = '';
  String deviceId = '';
  String sessionToken = '';

  Future initAPIService(BuildContext context) async {
    homeLoadingNotifier.value = true;

    if (await hasNetwork()) {
      try {
        // CALL API HERE
      } on DioException catch (e) {
        if (context.mounted) {
          FrontEndErrorHandler.errorHandler(
            context: context,
            dioException: e,
          );
        }
      } finally {
        homeLoadingNotifier.value = false;
      }
    } else {
      if (context.mounted) {
        InternetConnectionHandler.internetHandler(
          context,
          onTapRefresh: () {
            initAPIService(context);
          },
        );
      }
    }
  }
}
