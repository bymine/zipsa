import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class MailDetailPage extends StatelessWidget {
  const MailDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메일 보기"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                  left: mainHorizontalPadding,
                  right: mainHorizontalPadding,
                  top: mainTopPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mail Title is Hello World!!!",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Row(
                    children: const [
                      Text("보낸 사람"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("abc@naver.com",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: const [
                      Text("받는 사람"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("frfr07230723@naver.com",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffc4c4c4),
                        ),
                      ),
                      child: const Scrollbar(
                        child: SingleChildScrollView(
                          child: Text(
                            "Neque faucibus egestas enim non. Commodo enim consequat integer sodales. Tellus quisque massa nulla lorem eu eu. Nunc ctras odio est nec nulla nibh quam. Dolor dictum sed lectus sit tortor mauris sit dignissim nibh.A",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: mainColor,
                minimumSize: const Size(double.maxFinite, buttonHeight),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "답변 하기",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
