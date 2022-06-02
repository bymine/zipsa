import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class SettingEditUserPage extends StatelessWidget {
  const SettingEditUserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("닉네임 수정"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: mainHorizontalPadding,
                right: mainHorizontalPadding,
                top: mainTopPadding),
            child: InputWidget(
              title: "닉네임",
              hintText: "닉네임을 입력하세요",
              textEditingController: controller,
              suffix: IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: LineIcon(LineIcons.timesCircle)),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: mainColor,
                minimumSize: const Size(double.maxFinite, buttonHeight),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            onPressed: () {},
            child: const Text(
              "변경하기",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
