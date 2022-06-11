import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';
import 'package:zipsa_ui_design/src/repositorys/auth_repository.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository());
    Get.put(AuthController());
  }
}
