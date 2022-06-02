import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipsa_ui_design/src/bindings/init_bindings.dart';
import 'package:zipsa_ui_design/src/constants/page_constants.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "NotoSansKR",
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12),
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: true)),
        initialBinding: InitBindings(),
        initialRoute: '/',
        getPages: pages);
  }
}
