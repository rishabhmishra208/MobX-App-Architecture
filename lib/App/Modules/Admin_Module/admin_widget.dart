import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../App_Theme_Utils/app_theme_export.dart';
import '../../../Common_Widgets/common_widget_export.dart';

class AdminWidget extends StatelessWidget {
  const AdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.appMainColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: Container(),
      ),
      body: const RouterOutlet(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
