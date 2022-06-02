import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("프로필 편집"),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: mainHorizontalPadding,
            right: mainHorizontalPadding,
            top: mainTopPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: mainColor.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "프로필 정보",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "아이디",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc4c4c4)),
                          ),
                          Text(
                            "frfr0723@gmail.com",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "비밀번호",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffc4c4c4)),
                          ),
                          Text(
                            "********",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          )
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
