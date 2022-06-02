import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> mailTabs = <Tab>[
    const Tab(text: "받은 메일함"),
    const Tab(text: "보낸 메일함"),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: mailTabs.length, vsync: this);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
