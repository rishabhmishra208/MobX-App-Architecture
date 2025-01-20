// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'popup_handlers_export.dart';
import '../Alert_Dialogs/alert_dialogs_export.dart';
import '../Common_Function/comman_functions_export.dart';

class FrontEndErrorHandler {
  static errorHandler({
    required BuildContext context,
    DioException? dioException,
    String assetPath = '',
    String networkIcon = '',
    String title = '',
    String subTitle = '',
    String primaryBtnTitle = '',
    String secondaryBtnTitle = '',
    Function()? primaryBtnTap,
    Function()? secondaryBtnTap,
    bool isShowIcon = false,
    final double? svgIconSize,
  }) {
    dynamic dialog;
    // String primaryCTA = '';
    List<dynamic> ctaList = [];
    BuildContext? initialContext;

    dialog = AlertErrorDialog(
      assetPath: assetPath,
      networkIcon: networkIcon,
      title: title,
      subTitle: subTitle,
      isShowIcon: isShowIcon,
      svgIconSize: svgIconSize,
      primaryBtnTitle: primaryBtnTitle,
      secondaryBtnTitle: secondaryBtnTitle,
      primaryBtnTap: () {
        Navigator.pop(initialContext!);
        initialContext = null;

        if (primaryBtnTap != null) {
          primaryBtnTap();
        } else {
          ErrorHandlerCTAsUtils.handlePrimaryCTAsClick(
            primaryCTAsType: primaryBtnTitle,
            dioException: dioException,
          );
        }
      },
      secondaryBtnTap: secondaryBtnTitle.isEmpty
          ? null
          : () {
              Navigator.pop(initialContext!);
              initialContext = null;

              ErrorHandlerCTAsUtils.handleSecondryCTAsClick(
                secontryCTAsType: secondaryBtnTitle,
                dioException: dioException,
              );
            },
    );

    if (dioException != null && dioException.response != null) {
      if (ctaList.isNotEmpty) {
        showCustomDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            initialContext = _;
            return dialog;
          },
        );
      } else {
        showSnackBar(
          context,
          isCustomSnackBar: true,
          text: title,
        );
      }
    } else {
      showCustomDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          initialContext = _;
          return dialog;
        },
      );
    }
  }
}
