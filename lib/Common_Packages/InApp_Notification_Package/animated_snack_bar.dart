import 'package:flutter/material.dart';

import '../../Models/models_export.dart';
import '../../Constants/constants_export.dart';
import 'inapp_notification_package_export.dart';

List<AnimatedSnackBar> _snackBars = List.empty(growable: true);

class AnimatedSnackBar {
  final Duration duration;
  final WidgetBuilder builder;
  final MobileSnackBarPosition mobileSnackBarPosition;
  final MultipleSnackBarStrategy snackBarStrategy;
  final MobilePositionSettings mobilePositionSettings;
  final Duration animationDuration;
  final Curve animationCurve;
  late final SnackBarInfo info;
  ValueNotifier<bool> isTimerCancel = ValueNotifier(false);

  AnimatedSnackBar({
    this.duration = const Duration(seconds: 8),
    this.mobileSnackBarPosition = MobileSnackBarPosition.top,
    this.snackBarStrategy = const ColumnSnackBarStrategy(),
    this.mobilePositionSettings = const MobilePositionSettings(),
    this.animationDuration = const Duration(milliseconds: 400),
    this.animationCurve = Curves.easeInOut,
    required this.builder,
  });

  factory AnimatedSnackBar.material({
    MobileSnackBarPosition mobileSnackBarPosition = MobileSnackBarPosition.top,
    Duration duration = const Duration(seconds: 8),
    MultipleSnackBarStrategy snackBarStrategy = const ColumnSnackBarStrategy(),
    MobilePositionSettings mobilePositionSettings =
        const MobilePositionSettings(),
    Duration animationDuration = const Duration(
      milliseconds: 400,
    ),
    Curve animationCurve = Curves.easeInOut,
    required Notifications notifications,
    required Function() remove,
  }) {
    final ValueNotifier<bool> timerCancelled = ValueNotifier<bool>(false);

    builder(context) {
      return MaterialAnimatedSnackBar(
        notifications: notifications,
        remove: remove,
        isExpand: (p0) => timerCancelled.value = p0 ?? false,
      );
    }

    final snackBar = AnimatedSnackBar(
      duration: duration,
      builder: builder,
      snackBarStrategy: snackBarStrategy,
      mobileSnackBarPosition: mobileSnackBarPosition,
      mobilePositionSettings: mobilePositionSettings,
      animationDuration: animationDuration,
      animationCurve: animationCurve,
    );
    timerCancelled.addListener(
      () {
        if (timerCancelled.value) {
          snackBar.isTimerCancel.value = true;
        } else {
          snackBar.isTimerCancel.value = false;
        }
      },
    );
    return snackBar;
  }

  void remove([bool purge = true]) {
    if (info.removed) return;
    if (purge) _snackBars.remove(this);
    info.removed = true;
    info.entry.remove();
  }

  void show(BuildContext context) {
    newNotificationDislplayed.value = false;
    final overlay = Navigator.of(context).overlay!;
    info = SnackBarInfo(
      key: GlobalKey<RawAnimatedSnackBarState>(),
      createdAt: DateTime.now(),
    );

    info.entry = OverlayEntry(
      builder: (context) {
        return RawAnimatedSnackBar(
          isTimerCancel: isTimerCancel,
          // timer: timer,
          key: info.key,
          getInitialDy: () {
            return snackBarStrategy.computeDy(
              _snackBars,
              this,
            );
          },
          duration: duration,
          onRemoved: remove,
          mobileSnackBarPosition: mobileSnackBarPosition,
          mobilePositionSettings: mobilePositionSettings,
          animationDuration: animationDuration,
          animationCurve: animationCurve,
          child: builder.call(context),
        );
      },
    );

    if (_snackBars.isEmpty) {
      _snackBars.add(this);
    } else {
      newNotificationDislplayed.value = true;
      _snackBars.add(this);
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => overlay.insert(info.entry),
    );

    _snackBars = snackBarStrategy.onAdd(_snackBars, this);
  }

  static void removeAll() {
    for (var e in _snackBars) {
      e.remove(false);
    }
    _snackBars.removeWhere((element) => true);
  }
}

class SnackBarInfo {
  late final OverlayEntry entry;
  final GlobalKey<RawAnimatedSnackBarState> key;
  final DateTime createdAt;
  bool removed = false;

  SnackBarInfo({
    required this.key,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SnackBarInfo &&
        other.entry == entry &&
        other.key == key &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => entry.hashCode ^ key.hashCode ^ createdAt.hashCode;
}

extension Cleaner on List<AnimatedSnackBar> {
  List<AnimatedSnackBar> clean() {
    return where((element) => element.info.key.currentState != null).toList();
  }
}
