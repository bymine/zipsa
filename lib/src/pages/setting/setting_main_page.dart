import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("설정"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
                left: mainHorizontalPadding,
                right: mainHorizontalPadding,
                top: mainTopPadding),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: mainColor.withOpacity(0.5),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("박수빈",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40)),
                        onPressed: () {
                          Get.toNamed('/EditAccount');
                        },
                        child: const Text("프로필 편집",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: double.maxFinite,
              height: 6,
              child: Container(color: const Color(0xffe5e5e5))),
          Container(
            padding: const EdgeInsets.only(
                left: mainHorizontalPadding,
                right: mainHorizontalPadding,
                top: mainTopPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "닉네임",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc4c4c4)),
                          ),
                          Text(
                            "bymine",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/EditUser");
                        },
                        icon: LineIcon(
                          LineIcons.angleRight,
                          size: 20,
                          color: const Color(0xffc4c4c4),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "휴대전화",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc4c4c4)),
                          ),
                          Text(
                            "010-9663-6696",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/EditUser");
                        },
                        icon: LineIcon(
                          LineIcons.angleRight,
                          size: 20,
                          color: const Color(0xffc4c4c4),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "생일",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc4c4c4)),
                          ),
                          Text(
                            "1997-07-23",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/EditUser");
                        },
                        icon: LineIcon(
                          LineIcons.angleRight,
                          size: 20,
                          color: const Color(0xffc4c4c4),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            height: 6,
            child: Container(
              color: const Color(0xffe5e5e5),
            ),
          ),
          SwitchListTile(
              title: const Text(
                "시스템 알림 설정",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              value: false,
              onChanged: (value) {}),
          SwitchListTile(
              activeColor: mainColor,
              title: const Text(
                "마켓팅 정보 알림 설정",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              value: true,
              onChanged: (value) {}),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "회원 탈퇴",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "개인정보와 설정이 모두 삭제 됩니다.",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: LineIcon(
                      LineIcons.angleRight,
                      size: 20,
                      color: const Color(0xffc4c4c4),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
