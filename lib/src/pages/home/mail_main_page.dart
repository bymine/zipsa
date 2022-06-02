import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';
import 'package:zipsa_ui_design/src/controllers/mail_controller.dart';

class MailMainPage extends GetView<MailController> {
  const MailMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar =
        AppBar(title: const Text("내 메일함"), bottom: const MailBottomBar());

    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: TabBarView(controller: controller.controller, children: [
        ReceiveMailView(
          height: pageSize - (notifySize + appBarSize + 60),
        ),
        const SendMailView()
      ]),
    );
  }
}

class ReceiveMailView extends StatelessWidget {
  final double height;
  const ReceiveMailView({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scrollbar(
          child: SizedBox(
            height: height,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  20,
                  (index) => GestureDetector(
                    onTap: () {
                      Get.toNamed('/MailDetail');
                    },
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.check_box_outline_blank,
                              color: Color(0xffc4c4c4),
                              size: 20,
                            )),
                        Icon(
                          index % 2 == 0
                              ? LineIcons.envelope
                              : LineIcons.envelopeOpen,
                          size: 20,
                        ),
                        const Spacer(),
                        const Text("bymine"),
                        const Spacer(
                          flex: 2,
                        ),
                        const Text(
                          "mail title",
                          maxLines: 1,
                        ),
                        const Spacer(
                          flex: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
            Get.toNamed('/MailAdd');
          },
          child: const Text(
            "메일 쓰기",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class SendMailView extends StatelessWidget {
  const SendMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          5,
          (index) => Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.check_box_outline_blank))
                ],
              )),
    );
  }
}

class MailBottomBar extends GetView<MailController>
    implements PreferredSizeWidget {
  const MailBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TabBar(
            labelColor: Colors.black,
            indicatorColor: mainColor,
            tabs: controller.mailTabs,
            controller: controller.controller,
          ),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return mailShowTypes
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
              Text(mailShowTypes.first),
              const Icon(Icons.arrow_drop_down),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

List<String> mailShowTypes = [
  '모든 메일',
  '읽은 메세지',
  '읽지 않은 메세지',
];
