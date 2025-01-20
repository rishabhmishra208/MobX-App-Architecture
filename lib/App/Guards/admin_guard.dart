import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';

import '../../Constants/constants_export.dart';

class AdminGuard extends RouteGuard {
  AdminGuard() : super(redirectTo: Routes.homeScreen);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return true;
  }
}
