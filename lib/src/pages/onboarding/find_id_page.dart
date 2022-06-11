import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/constants/reg_exp_constants.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class FindIdPage extends GetView<AuthController> {
  const FindIdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar();
    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: Form(
        key: controller.findIdFormKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: pageSize - (notifySize + appBarSize),
            child: Column(
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InputWidget(
                        textEditingController: controller.findIdName,
                        title: "이름",
                        mode: AutovalidateMode.onUserInteraction,
                        hintText: "본명을 입력해 주세요",
                        validator: (name) {
                          if (name!.isEmpty) {
                            return "이름을 입력하세요.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InputWidget(
                        mode: AutovalidateMode.onUserInteraction,
                        textEditingController: controller.findIdBirth,
                        inputType: TextInputType.number,
                        title: "생년월일",
                        hintText: "YYYYMMDD",
                        validator: (birth) {
                          if (birth!.isEmpty) {
                            return "생년월일 입력하세요.";
                          } else if (!regExpBirth.hasMatch(birth)) {
                            return "잘못된 생년월일 형식입니다";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InputWidget(
                          textEditingController: controller.findIdPhone,
                          inputType: TextInputType.phone,
                          title: "휴대폰 인증",
                          mode: AutovalidateMode.onUserInteraction,
                          hintText: "휴대폰 번호 (숫자만)",
                          validator: (phone) {
                            if (phone!.isEmpty) {
                              return "휴대전화 번호을 입력하세요.";
                            } else if (!regExpPhone.hasMatch(phone)) {
                              return "잘못된 휴대전화 형식 입니다";
                            }
                            return null;
                          },
                          button: InkWell(
                            onTap: () {
                              controller.requestVerificationNumber("FindId");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: mainColor)),
                              child: const Text(
                                "인증받기",
                                style:
                                    TextStyle(fontSize: 10, color: mainColor),
                              ),
                            ),
                          )),
                      Obx(
                        () => Visibility(
                          visible: controller.findIdVerifyPhone.value.status ==
                                  "SUCCESS" &&
                              controller.findIdConfirmCode.value.status !=
                                  "SUCCESS",
                          child: InputWidget(
                              textEditingController: controller.findIdCode,
                              inputType: TextInputType.phone,
                              mode: AutovalidateMode.onUserInteraction,
                              hintText: "인증코드",
                              validator: (phone) {
                                if (phone!.isEmpty) {
                                  return "인증 번호을 입력하세요.";
                                }
                                return null;
                              },
                              button: InkWell(
                                onTap: () {
                                  controller
                                      .confirmationVerificationNumber("FindId");
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(color: mainColor)),
                                  child: const Text(
                                    "인증확인",
                                    style: TextStyle(
                                        fontSize: 10, color: mainColor),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
