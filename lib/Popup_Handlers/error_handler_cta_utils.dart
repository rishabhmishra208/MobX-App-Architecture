import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Common_Function/app_localization_extension.dart';

class ErrorHandlerCTAsUtils {
  // ---------- Handle Primary CTAs click ----------

  static handlePrimaryCTAsClick({
    required String primaryCTAsType,
    DioException? dioException,
  }) async {
    switch (primaryCTAsType) {
      case 'okay': // OKAY
        // NO_ACTION

        break;
    }
  }

  // ---------- Handle Secondry CTAs click ----------

  static handleSecondryCTAsClick({
    required String secontryCTAsType,
    DioException? dioException,
  }) async {
    switch (secontryCTAsType) {
      case 'no': // NO
        // NO_ACTION

        break;
    }
  }

  // ---------- Get CTAs Title's ----------

  static getCTAsTitle(BuildContext context, String ctaValue) {
    switch (ctaValue) {
      case "OKAY":
        return context.localization.okayCTA;
      default:
        return context.localization.okayCTA;
    }
  }
}
