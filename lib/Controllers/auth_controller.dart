import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  // @observable
  // CheckLoginEnvModel checkLoginEnvModel = CheckLoginEnvModel();

  // @action
  // loadcheckLoginEnvironment(CheckLoginEnvModel checkLoginEnvModel) {
  //   this.checkLoginEnvModel = checkLoginEnvModel;
  // }
}
