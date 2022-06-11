import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/pages/board/board_page.dart';

class BoardDetailPage extends StatelessWidget {
  const BoardDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: pageSize - (notifySize + appBarSize + 60),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: mainHorizontalPadding,
                    right: mainHorizontalPadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VoteWriting(),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          text: "댓글 ",
                          children: [
                            TextSpan(
                                text: "2",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff7d7d7d)))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: mainColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Bymine"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Hello Flutter World!!!",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "5분 전",
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: LineIcon(LineIcons.horizontalEllipsis))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 50,
                              child: Icon(Icons.subdirectory_arrow_right)),
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: mainColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("John"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Today is nick!",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "1초 전",
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: LineIcon(LineIcons.horizontalEllipsis))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 50,
                              child: Icon(Icons.subdirectory_arrow_right)),
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: mainColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("John"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Today is nick!",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "1초 전",
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: LineIcon(LineIcons.horizontalEllipsis))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundColor: mainColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Bymine"),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Hello Flutter World!!!",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "5분 전",
                                  style: TextStyle(
                                      color: Color(0xff7d7d7d), fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: LineIcon(LineIcons.horizontalEllipsis))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: mainHorizontalPadding,
                  right: mainHorizontalPadding,
                  top: 10,
                  bottom: 10),
              height: 60,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(fontSize: 12),
                    hintText: "댓글을 입력하세요",
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: LineIcon(LineIcons.paperPlane)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide:
                            const BorderSide(color: Color(0xff7d7d7d)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
