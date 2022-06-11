import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';

class ShowIdPage extends GetView<AuthController> {
  const ShowIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageSize - (notifySize + appBarSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: mainHorizontalPadding,
                    right: mainHorizontalPadding,
                    top: mainTopPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "아이디 찾기",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      controller
                          .formatEmail(controller.findIdResponse.value.detail),
                      style: const TextStyle(
                          color: mainColor, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "입력하신 휴대폰 번호로 가입된 아이디입니다.\n개인정보 보호를 위해 뒷자리는 ***으로 표시됩니다.",
                      style: TextStyle(color: Color(0xff7d7d7d)),
                    )
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    minimumSize: const Size(double.maxFinite, buttonHeight),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero)),
                onPressed: () {
                  Get.offAllNamed('/SignIn');
                },
                child: const Text(
                  "로그인",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
