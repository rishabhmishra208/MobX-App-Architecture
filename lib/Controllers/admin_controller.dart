import 'package:mobx/mobx.dart';

part 'admin_controller.g.dart';

class AdminController = AdminControllerBase with _$AdminController;

abstract class AdminControllerBase with Store {
  // @observable
  // GameSessionModel gameSessionModel = GameSessionModel();

  // @action
  // loadGameSession(GameSessionModel gameSessionModel) {
  //   this.gameSessionModel = gameSessionModel;
  // }
}
