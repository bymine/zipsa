import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buildings = ["에스빌", "그린빌", "로즈빌"];
    String _vote = 'a';
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: PopupMenuButton(
          itemBuilder: (context) {
            return buildings
                .map((e) => PopupMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ))
                .toList();
          },
          child: Row(
            children: [
              Text(buildings.first),
              const Icon(Icons.arrow_drop_down),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: LineIcon(LineIcons.search)),
          IconButton(
              onPressed: () {
                Get.toNamed('/BoardAdd');
              },
              icon: LineIcon(LineIcons.edit)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
            left: mainHorizontalPadding,
            right: mainHorizontalPadding,
            top: mainTopPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Get.toNamed('/BoardDetail');
                  },
                  child: const FreeWriting()),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const NoticeWriting(),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const VoteWriting()
            ],
          ),
        ),
      ),
    );
  }
}

class VoteWriting extends StatelessWidget {
  const VoteWriting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  Text(
                    "Bymine의 자유글",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2022년 12월 13일 오후 04:02",
                    style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: LineIcon(
                  LineIcons.horizontalEllipsis,
                ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Faucibus donec bibendum scelerisque blandit egestas dignissim odio nascetur vitae. Arcu lobortis in vulputate egestas.Aliquam ultrices eu bibendum diam viverra.",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              RadioListTile(
                  title: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "vote a",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  activeColor: mainColor,
                  value: "a",
                  groupValue: "a",
                  onChanged: (value) {}),
              RadioListTile(
                  title: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "vote b",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  activeColor: mainColor,
                  value: "b",
                  groupValue: "a",
                  onChanged: (value) {}),
              RadioListTile(
                  title: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "vote c",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  activeColor: mainColor,
                  value: "b",
                  groupValue: "a",
                  onChanged: (value) {}),
              RadioListTile(
                  title: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "vote d",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  activeColor: mainColor,
                  value: "b",
                  groupValue: "a",
                  onChanged: (value) {}),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: LineIcon(
                  LineIcons.heartAlt,
                  color: Colors.redAccent,
                )),
            IconButton(onPressed: () {}, icon: LineIcon(LineIcons.commentDots)),
            Expanded(child: Container()),
            const Text(
              "좋아요 8 댓글 1",
              style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
            )
          ],
        )
      ],
    );
  }
}

class FreeWriting extends StatelessWidget {
  const FreeWriting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  Text(
                    "Bymine의 자유글",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2022년 12월 13일 오후 04:02",
                    style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: LineIcon(
                  LineIcons.horizontalEllipsis,
                ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Faucibus donec bibendum scelerisque blandit egestas dignissim odio nascetur vitae. Arcu lobortis in vulputate egestas.Aliquam ultrices eu bibendum diam viverra. Neque, mauris a aliquet purus. Id sed turpis integer pellentesque etiam id in suspendisse.",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: LineIcon(LineIcons.heart)),
            IconButton(onPressed: () {}, icon: LineIcon(LineIcons.commentDots)),
            Expanded(child: Container()),
            const Text(
              "좋아요 8 댓글 1",
              style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
            )
          ],
        )
      ],
    );
  }
}

class NoticeWriting extends StatelessWidget {
  const NoticeWriting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                  Text(
                    "Bymine의 자유글",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "2022년 12월 13일 오후 04:02",
                    style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: LineIcon(
                  LineIcons.horizontalEllipsis,
                ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Faucibus donec bibendum scelerisque blandit egestas dignissim odio nascetur vitae. Arcu lobortis in vulputate egestas.Aliquam ultrices eu bibendum diam viverra.",
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 16,
        ),
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: LineIcon(LineIcons.heart)),
            IconButton(onPressed: () {}, icon: LineIcon(LineIcons.commentDots)),
            Expanded(child: Container()),
            const Text(
              "좋아요 8 댓글 1",
              style: TextStyle(fontSize: 10, color: Color(0xffc4c4c4)),
            )
          ],
        )
      ],
    );
  }
}
