import 'package:flutter/material.dart';

import '../Icons_Utils/icons_export.dart';
import '../Alert_Dialogs/alert_dialogs_export.dart';
import '../Common_Function/comman_functions_export.dart';

class InternetConnectionHandler {
  static internetHandler(
    BuildContext context, {
    required Function() onTapRefresh,
  }) {
    // ----- Show Dialog -----

    showCustomDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertErrorDialog(
          isDisable: false,
          assetPath: svgWifi,
          title: context.localization.noInternetConnection,
          subTitle: context.localization.notConnectedInternet,
          primaryBtnTitle: context.localization.refreshCTA,
          primaryBtnTap: () {
            Navigator.pop(context);
            onTapRefresh();
          },
        );
      },
    );
  }
}
