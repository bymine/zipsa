import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

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
                Get.toNamed("/BookSearch");
              },
              icon: LineIcon(LineIcons.search)),
          IconButton(
              onPressed: () {
                Get.toNamed("/Mail");
              },
              icon: LineIcon(LineIcons.bell)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
              left: mainHorizontalPadding,
              right: mainHorizontalPadding,
              top: mainTopPadding),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "전체",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  PopupMenuButton(
                    itemBuilder: (context) {
                      return walletShowTypes
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
                        Text(walletShowTypes.first),
                        const Icon(Icons.arrow_drop_down),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: mainColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "에스빌 409호",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

List<String> walletShowTypes = ["최신 등록순", "새입자만 보기", "집주인만 보기"];
