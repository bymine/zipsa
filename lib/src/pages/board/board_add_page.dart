import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class BoardAddPage extends StatelessWidget {
  const BoardAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text("게시판 작성하기"),
    );
    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: pageSize - (notifySize + appBarSize + 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                          children: const [
                            Chip(
                              label: Text(
                                "자유글",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: mainColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Chip(
                              side: BorderSide(color: mainColor),
                              backgroundColor: Colors.transparent,
                              label: Text(
                                "공지 사항",
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Chip(
                              side: BorderSide(color: mainColor),
                              backgroundColor: Colors.transparent,
                              label: Text(
                                "투표",
                                style: TextStyle(color: mainColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffc4c4c4)),
                              borderRadius: BorderRadius.circular(8)),
                          child: const TextField(
                            maxLines: 8,
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.maxFinite,
                      height: 100,
                      child: Container(
                        color: const Color(0xffe5e5e5),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: mainTopPadding),
                        child: Text("글쓰기 설정"),
                      ),
                      SwitchListTile(
                          activeColor: mainColor,
                          title: const Text(
                            "댓글 허용",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text(
                            "다른 사람이 댓글을 달 수 있어요",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff7d7d7d)),
                          ),
                          value: true,
                          onChanged: (value) {}),
                      SwitchListTile(
                          activeColor: mainColor,
                          title: const Text(
                            "좋아요 싫어요 허용",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text(
                            "다른 사람이 좋아요 싫어요를 누를 수 있어요",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff7d7d7d)),
                          ),
                          value: false,
                          onChanged: (value) {}),
                    ],
                  )
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
              "작성하기",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
