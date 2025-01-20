import 'package:flutter/material.dart';
import '../App_Theme_Utils/app_theme_export.dart';
import '../Common_Function/app_localization_extension.dart';

showSnackBar(
  BuildContext context, {
  bool isCustomSnackBar = false,
  required String text,
  Function()? onPressed,
}) {
  final snackBar = ScaffoldMessenger.of(context);

  snackBar.showSnackBar(
    SnackBar(
      behavior: isCustomSnackBar ? SnackBarBehavior.floating : null,
      elevation: isCustomSnackBar ? 0 : null,
      content: Text(text),
      action: isCustomSnackBar
          ? null
          : SnackBarAction(
              label: context.localization.doneCTA,
              onPressed: onPressed ?? snackBar.hideCurrentSnackBar,
            ),
    ),
  );
}

showMaterialBanner({
  required BuildContext context,
  required Widget content,
}) {
  final materialBanner = ScaffoldMessenger.of(context);

  materialBanner.showMaterialBanner(
    MaterialBanner(
      overflowAlignment: OverflowBarAlignment.start,
      backgroundColor: ThemeConstants.appMainColor,
      actions: [
        TextButton(
          onPressed: () {
            materialBanner.hideCurrentMaterialBanner();
          },
          child: Text(
            context.localization.ignore,
          ),
        ),
      ],
      content: content,
    ),
  );
}
