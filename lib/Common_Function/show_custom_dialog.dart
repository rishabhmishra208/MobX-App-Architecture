import 'package:flutter/material.dart';

bool isOpenDialog = false;

showCustomDialog({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = false,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = false,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
  bool isBackDisable = true,
}) {
  if (isOpenDialog) {
    return;
  }

  isOpenDialog = true;

  return showDialog(
    context: context,
    builder: (context) {
      final builtWidget = builder(context);
      return isBackDisable
          ? PopScope(
              canPop: false,
              child: builtWidget,
            )
          : builtWidget;
    },
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
    traversalEdgeBehavior: traversalEdgeBehavior,
  ).then(
    (value) {
      isOpenDialog = false;
      return null;
    },
  );
}
