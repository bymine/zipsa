import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/constants/reg_exp_constants.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class ChangePwPage extends GetView<AuthController> {
  const ChangePwPage({Key? key}) : super(key: key);

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
          child: Form(
            key: controller.changePwFormKey,
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
                        "비밀번호 재설정",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InputWidget(
                        textEditingController: controller.changePw,
                        title: "비밀번호",
                        mode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        hintText: "영문, 숫자, 특수문자 조합 8가지 이상",
                        validator: (password) {
                          if (password!.isEmpty) {
                            return "비밀번호을 입력하세요.";
                          } else if (!regExpPassword.hasMatch(password)) {
                            return "잘못된 비밀번호 형식입니다 (영문, 숫자, 특수문자 조합 8자리 이상)";
                          }
                          return null;
                        },
                      ),
                      InputWidget(
                        textEditingController: controller.changeRePw,
                        title: null,
                        obscureText: true,
                        mode: AutovalidateMode.onUserInteraction,
                        hintText: "비밀번호 재입력",
                        validator: (rePassword) {
                          if (rePassword!.isEmpty) {
                            return "비밀번호 재입력을 입력하세요.";
                          } else if (controller.changePw.text != rePassword) {
                            return "비밀번호가 일치하지 않습니다";
                          }
                          return null;
                        },
                      ),
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
                    controller.changePwfunc();
                  },
                  child: const Text(
                    "완료",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
