import 'package:flutter/material.dart';

import '../../Models/models_export.dart';

final defaultBorderRadius = BorderRadius.circular(8);

class MaterialAnimatedSnackBar extends StatelessWidget {
  final Notifications notifications;
  final Function() remove;
  final Function(bool?)? isExpand;

  const MaterialAnimatedSnackBar({
    super.key,
    required this.notifications,
    required this.remove,
    required this.isExpand,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
    // CREATE CUSTOM IN-APP NOTIFICATION UI HERE
  }
}
