import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/controllers/app_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
