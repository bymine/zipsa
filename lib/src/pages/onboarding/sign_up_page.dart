import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 가입"),
      ),
      body: SingleChildScrollView(
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
                children: const [
                  Text(
                    "집사와 함께\n임대관리를 시작해 볼까요?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputWidget(
                    title: "아이디",
                    hintText: "이메일을 입력해주세요.",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputWidget(
                    title: "비밀번호",
                    hintText: "영문, 숫자, 특수문자 조합 8가지 이상",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputWidget(
                    title: "비밀번호 확인",
                    hintText: "비밀번호 재입력",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputWidget(
                    title: "생년월일",
                    hintText: "생년월일을 입력해주세요. ex) 19970723",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputWidget(
                    title: "휴대전화 번호 인증",
                    hintText: "휴대전화 번호를 입력해주세요.",
                  ),
                  SizedBox(
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
            Container(
              padding: const EdgeInsets.only(
                  left: mainHorizontalPadding,
                  right: mainHorizontalPadding,
                  top: mainTopPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "마켓팅 정보 수신 (선택)",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  CheckboxListTile(
                    activeColor: mainColor,
                    contentPadding: EdgeInsets.zero,
                    title: const Text("전체 동의 합니다.",
                        style: const TextStyle(fontSize: 14)),
                    value: true,
                    onChanged: (value) {},
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
                          title:
                              const Text("SMS", style: TextStyle(fontSize: 12)),
                          value: false,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      Flexible(
                        child: CheckboxListTile(
                          activeColor: mainColor,
                          contentPadding: EdgeInsets.zero,
                          title:
                              const Text("이메일", style: TextStyle(fontSize: 12)),
                          value: false,
                          onChanged: (value) {},
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
                    value: true,
                    onChanged: (value) {},
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
                          value: true,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text("내용보기"))
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
                          value: true,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text("내용보기"))
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
                          value: true,
                          onChanged: (value) {},
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text("내용보기"))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  minimumSize: const Size(double.maxFinite, buttonHeight),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
              onPressed: () {},
              child: const Text(
                "집사 시작하기",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
