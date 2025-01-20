// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'package:flutter/material.dart';
import 'inapp_notification_package_export.dart';

Duration _opacityDuration = const Duration(milliseconds: 400);

// ignore: must_be_immutable
class RawAnimatedSnackBar extends StatefulWidget {
  RawAnimatedSnackBar({
    super.key,
    required this.duration,
    required this.child,
    required this.onRemoved,
    required this.mobileSnackBarPosition,
    required this.getInitialDy,
    required this.mobilePositionSettings,
    required this.animationDuration,
    required this.animationCurve,
    // required this.timer,
    required this.isTimerCancel,
  });

  final Duration duration;
  final Widget child;
  final VoidCallback onRemoved;
  final MobileSnackBarPosition mobileSnackBarPosition;
  final double Function() getInitialDy;
  final MobilePositionSettings mobilePositionSettings;
  final Duration animationDuration;
  final Curve animationCurve;
  // Timer timer;
  ValueNotifier<bool> isTimerCancel = ValueNotifier(true);

  @override
  State<RawAnimatedSnackBar> createState() => RawAnimatedSnackBarState();
}

class RawAnimatedSnackBarState extends State<RawAnimatedSnackBar> {
  late Timer timer;
  bool isVisible = false;
  bool removed = false;

  double opacity = 1;

  final GlobalKey positionedKey = GlobalKey();

  void remove() {
    if (mounted && removed == false) {
      widget.onRemoved();
      removed = true;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => isVisible = true);
    });

    final fadeOutDuration = Duration(
      milliseconds:
          (widget.duration.inMilliseconds / 4).clamp(100, 2000).toInt(),
    );
    timer = Timer(
      widget.duration - fadeOutDuration,
      () {
        if (mounted) {
          setState(() => isVisible = false);
          Future.delayed(fadeOutDuration, () {
            remove();
          });
        }
      },
    );
    widget.isTimerCancel.addListener(
      () {
        if (widget.isTimerCancel.value) {
          timer.cancel();
        } else {
          timer = Timer(
            widget.duration - fadeOutDuration,
            () {
              if (mounted) {
                setState(() => isVisible = false);
                Future.delayed(fadeOutDuration, () {
                  remove();
                });
              }
            },
          );
        }
      },
    );

    super.initState();
  }

  double? get top {
    if (widget.mobileSnackBarPosition == MobileSnackBarPosition.top) {
      if (isVisible) {
        return widget.mobilePositionSettings.topOnAppearance +
            widget.getInitialDy();
      } else {
        return widget.mobilePositionSettings.topOnDissapear;
      }
    } else if (widget.mobileSnackBarPosition == MobileSnackBarPosition.bottom) {
      return null;
    }

    throw UnimplementedError();
  }

  double? get left {
    return widget.mobilePositionSettings.left;
  }

  double? get right {
    return widget.mobilePositionSettings.right;
  }

  double? get width {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      key: positionedKey,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      top: top,
      left: left,
      right: right,
      child: AnimatedOpacity(
        duration: _opacityDuration,
        opacity: opacity,
        child: CustomDismissible(
          onDismissed: () {
            remove();
          },
          child: Material(
            color: Colors.transparent,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
