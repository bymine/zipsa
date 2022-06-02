import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  RxInt count = 0.obs;

  @override
  void onReady() {
    super.onReady();
    count.bindStream(Stream.value(isCount));
    ever(count, (int value) {
      if (value == 0) {
        Get.offAllNamed('/SignIn');
      } else {
        Get.offAllNamed('/App');
      }
    });
  }

  int get isCount => box.read('count') ?? 0;
}
