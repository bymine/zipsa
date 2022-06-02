import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/controllers/mail_controller.dart';

class MailBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MailController());
  }
}
