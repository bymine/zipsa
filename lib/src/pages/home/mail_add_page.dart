import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class MailAddPage extends StatelessWidget {
  const MailAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메일 쓰기"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: mainHorizontalPadding,
                right: mainHorizontalPadding,
                top: mainTopPadding),
            child: Column(
              children: [
                InputWidget(
                  title: "받는 사람",
                  hintText: "받는 사람을 입력하세요.",
                ),
                SizedBox(
                  height: 36,
                ),
                InputWidget(
                  title: "제목",
                  hintText: "제목을 입력하세요.",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
