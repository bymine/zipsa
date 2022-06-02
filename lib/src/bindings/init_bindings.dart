import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
