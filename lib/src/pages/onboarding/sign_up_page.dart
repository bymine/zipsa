import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/constants/reg_exp_constants.dart';
import 'package:zipsa_ui_design/src/controllers/auth_controller.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/find_pw_page.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 가입"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      "집사와 함께\n임대관리를 시작해 볼까요?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputWidget(
                      textEditingController: controller.signUpEmail,
                      title: "아이디",
                      hintText: "이메일을 입력해주세요.",
                      mode: AutovalidateMode.onUserInteraction,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "이메일을 입력하세요.";
                        } else if (!regExpEmail.hasMatch(email)) {
                          return "잘못된 이메일 형식입니다.";
                        } else if (controller.duplicateEmail(email)) {
                          return "이미 사용중인 이메일입니다";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputWidget(
                      textEditingController: controller.signUpPassword,
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
                      textEditingController: controller.signUpRePassword,
                      title: null,
                      obscureText: true,
                      mode: AutovalidateMode.onUserInteraction,
                      hintText: "비밀번호 재입력",
                      validator: (rePassword) {
                        if (rePassword!.isEmpty) {
                          return "비밀번호 재입력을 입력하세요.";
                        } else if (controller.signUpPassword.text !=
                            rePassword) {
                          return "비밀번호가 일치하지 않습니다";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputWidget(
                      textEditingController: controller.signUpName,
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
                      height: 40,
                    ),
                    InputWidget(
                      textEditingController: controller.signUpNickname,
                      title: "닉네임",
                      mode: AutovalidateMode.onUserInteraction,
                      hintText: "닉네임을 입력해 주세요",
                      validator: (nickname) {
                        if (nickname!.isEmpty) {
                          return "닉네임을 입력하세요.";
                        } else if (controller.duplicateNickName(nickname)) {
                          return "이미 사용중인 닉네임입니다";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InputWidget(
                      mode: AutovalidateMode.onUserInteraction,
                      textEditingController: controller.signUpBirth,
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
                      height: 40,
                    ),
                    InputWidget(
                      textEditingController: controller.signUpPhone,
                      inputType: TextInputType.phone,
                      title: "휴대폰 인증",
                      mode: AutovalidateMode.onUserInteraction,
                      hintText: "휴대폰 (숫자만)",
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
                          controller.requestVerificationNumber("SignUp");
                          Get.dialog(const AlertMessage(
                            message: "SMS 인증 코드가 발송되었습니다.",
                          ));
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: mainColor)),
                            child: Text(
                              controller.signUpRequestCode.value.status ==
                                      "SUCCESS"
                                  ? "재전송"
                                  : controller.signUpVerifyCode.value.status ==
                                          "SUCCESS"
                                      ? "인증완료"
                                      : "인증받기",
                              style: const TextStyle(
                                  fontSize: 10, color: mainColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Visibility(
                        visible: controller.signUpRequestCode.value.status ==
                                "SUCCESS" &&
                            controller.signUpVerifyCode.value.status !=
                                "SUCCESS",
                        child: InputWidget(
                            textEditingController: controller.signUpCode,
                            inputType: TextInputType.phone,
                            mode: AutovalidateMode.onUserInteraction,
                            hintText: "인증코드",
                            validator: (phone) {
                              if (phone!.isEmpty) {
                                return "휴대전화 번호을 입력하세요.";
                              }
                              return null;
                            },
                            button: InkWell(
                              onTap: () {
                                controller
                                    .confirmationVerificationNumber("SignUp");
                                Get.dialog(const AlertMessage(
                                  message: "휴대폰 인증이 완료되었습니다.",
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: mainColor)),
                                child: const Text(
                                  "인증확인",
                                  style:
                                      TextStyle(fontSize: 10, color: mainColor),
                                ),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 8,
                color: hintColor,
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(
                      left: mainHorizontalPadding,
                      right: mainHorizontalPadding,
                      top: mainTopPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "마켓팅 정보 수신 (선택)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CheckboxListTile(
                        activeColor: mainColor,
                        contentPadding: EdgeInsets.zero,
                        title: const Text("전체 동의 합니다.",
                            style: TextStyle(fontSize: 14)),
                        value: controller.allMarket.value,
                        onChanged: (value) {
                          controller.marketCheck("all");
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        color: hintColor,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("SMS",
                                  style: TextStyle(fontSize: 12)),
                              value: controller.smsMarket.value,
                              onChanged: (value) {
                                controller.marketCheck("sms");
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          Flexible(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("이메일",
                                  style: TextStyle(fontSize: 12)),
                              value: controller.mailMarket.value,
                              onChanged: (value) {
                                controller.marketCheck("mail");
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "약관 동의",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CheckboxListTile(
                        activeColor: mainColor,
                        contentPadding: EdgeInsets.zero,
                        title: const Text("전체 동의 합니다.",
                            style: TextStyle(fontSize: 14)),
                        value: controller.allAgree.value,
                        onChanged: (value) {
                          controller.agreeCheck("all");
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      Container(
                        width: double.infinity,
                        height: 0.5,
                        color: hintColor,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("이용 약관에 동의 합니다. (필수)",
                                  style: TextStyle(fontSize: 12)),
                              value: controller.useAgree.value,
                              onChanged: (value) {
                                controller.agreeCheck("use");
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("내용보기"))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("개인정보 수집 및 이용에 동의합니다. (필수)",
                                  style: TextStyle(fontSize: 12)),
                              value: controller.infoAgree.value,
                              onChanged: (value) {
                                controller.agreeCheck("info");
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("내용보기"))
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: mainColor,
                              contentPadding: EdgeInsets.zero,
                              title: const Text("만 14세 이상입니다. (필수)",
                                  style: TextStyle(fontSize: 12)),
                              value: controller.ageAgree.value,
                              onChanged: (value) {
                                controller.agreeCheck("age");
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text("내용보기"))
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary:
                          controller.activeSignUp ? mainColor : Colors.grey,
                      minimumSize: const Size(double.maxFinite, buttonHeight),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    controller.signUp();
                  },
                  child: const Text(
                    "집사 시작하기",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
