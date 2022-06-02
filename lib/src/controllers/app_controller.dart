import 'package:get/get.dart';

class AppController extends GetxController {
  RxInt index = 0.obs;

  changeIndex(int index) {
    this.index(index);
  }
}
