import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Services/services_export.dart';
import 'App/Modules/App_Module/app_module.dart';
import 'App/Modules/App_Module/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  // await Firebase.initializeApp();
  // await AwesomeNotificationService.initializeAwesomeNotification();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
