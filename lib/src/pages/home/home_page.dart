import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "ZIPSA",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: mainColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed("/AddHouse");
              },
              icon: LineIcon(LineIcons.folderPlus)),
          IconButton(
              onPressed: () {
                Get.toNamed("/Mail");
              },
              icon: LineIcon(LineIcons.bell)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: mainHorizontalPadding,
            right: mainHorizontalPadding,
            top: mainTopPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "월간 수납 현황",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const Divider(
                    color: Color(0xffc4c4c4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "납부",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "7",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "대기",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "연체",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "2",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "공실",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xffc4c4c4))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "월간 납부 현황",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        "D-15",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color(0xffc4c4c4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "납부",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "7",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "대기",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "3",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "연체",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "2",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("일일 수납 내역"),
            const Text(
              "16, 수",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xffc4c4c4),
                ),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("에스빌 409호"),
                    ),
                  ),
                  Text(
                    "대기",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
