import 'package:flutter/material.dart';

import 'inapp_notification_package_export.dart';

class MobilePositionSettings {
  final double topOnAppearance;
  final double topOnDissapear;
  final double left;
  final double right;
  final double bottomOnAppearance;
  final double bottomOnDissapear;

  const MobilePositionSettings({
    this.topOnAppearance = 70,
    this.topOnDissapear = -100,
    this.left = 8,
    this.right = 8,
    this.bottomOnAppearance = 70,
    this.bottomOnDissapear = -100,
  });
}

/// Snack bar position on desktop and web devices (screens with width > 600)
enum DesktopSnackBarPosition {
  topCenter,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  bottomCenter,
}

/// Snack bar position on mobile devices (screens with width <= 600)
enum MobileSnackBarPosition { top, bottom }

/// A class to implement behaviour when having multiple snack bars
/// at once,
/// See
///   [ColumnSnackBarStrategy]
///   [RemoveSnackBarStrategy]
///   [StackSnackBarStrategy]
/// for implementation
abstract class MultipleSnackBarStrategy {
  double computeDy(List<AnimatedSnackBar> snackBars, AnimatedSnackBar self);
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self);
}

/// This class will allow you to show multiple snack bars
/// in a column format with a pre-defined gap between them.
class ColumnSnackBarStrategy implements MultipleSnackBarStrategy {
  /// Space between snackbars in the column
  final double gap;

  const ColumnSnackBarStrategy({
    this.gap = 8,
  });

  @override
  double computeDy(
    List<AnimatedSnackBar> snackBars,
    AnimatedSnackBar self,
  ) {
    final index = snackBars.indexWhere(
      (element) => element.info.key.currentContext != null,
    );

    if (index != -1) {
      final olderBars = snackBars.where(
        (element) {
          bool isMobileAndSamePosition =
              (element.mobileSnackBarPosition == self.mobileSnackBarPosition);

          return (isMobileAndSamePosition) &&
              (element.info.key.currentState?.isVisible ?? false) &&
              element.info.createdAt.isBefore(self.info.createdAt);
        },
      ).toList();

      return olderBars.fold<double>(0, (initialValue, element) {
        final box =
            element.info.key.currentContext?.findRenderObject() as RenderBox;
        return initialValue + box.size.height;
      });
    }
    return 0;
  }

  @override
  List<AnimatedSnackBar> onAdd(
      List<AnimatedSnackBar> snackBars, AnimatedSnackBar self) {
    return snackBars;
  }
}
