// import 'dart:async';
// import 'package:flutter_modular/flutter_modular.dart';

// import '../../Constants/constants_export.dart';
// import '../../Controllers/controllers_export.dart';

// class AuthGuard extends RouteGuard {
//   AuthGuard() : super(redirectTo: Routes.signinScreen);

//   @override
//   FutureOr<bool> canActivate(String path, ParallelRoute route) {
//     var token = Modular.get<AuthController>().loginModel.sessionToken;

//     return token != null;
//   }
// }
