import 'package:flutter_modular/flutter_modular.dart';

import '../../Guards/admin_guard.dart';
import '../Admin_Module/admin_module.dart';
import '../../../Constants/constants_export.dart';
import '../../../Controllers/controllers_export.dart';

class AppModule extends Module {
  AppModule();

  @override
  void binds(i) {
    i.addInstance(AdminController());
  }

  @override
  void routes(r) {
    r.module(
      Routes.splash,
      module: AdminModule(),
      guards: [AdminGuard()],
      transition: TransitionType.noTransition,
    );
  }
}
