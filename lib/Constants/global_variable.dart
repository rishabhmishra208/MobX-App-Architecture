import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Services/services_export.dart';
import '../Controllers/controllers_export.dart';

// ----- VARIABLE'S -----

// ----- SERVICE'S -----

RestService restService = Modular.get<RestService>();
AuthController authController = Modular.get<AuthController>();
AdminController adminController = Modular.get<AdminController>();

// ----- VALUE NOTIFIER -----

ValueNotifier<bool> homeLoadingNotifier = ValueNotifier<bool>(false);
ValueNotifier<bool> newNotificationDislplayed = ValueNotifier<bool>(false);

// ----- GLOBALKEY -----

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
