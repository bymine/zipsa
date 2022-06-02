import 'package:flutter/material.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/constants/dimens_constants.dart';

import 'package:zipsa_ui_design/src/widgets/input_widget.dart';

class AddHousePage extends StatelessWidget {
  const AddHousePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text("건물 등록하기"),
    );
    double pageSize = MediaQuery.of(context).size.height;
    double notifySize = MediaQuery.of(context).padding.top;
    double appBarSize = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: pageSize - (notifySize + appBarSize),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: mainHorizontalPadding,
                    right: mainHorizontalPadding,
                    top: mainTopPadding),
                child: Column(
                  children: const [
                    InputWidget(
                      title: "건물명",
                      hintText: "건물명을 입력하세요.",
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InputWidget(
                      title: "호수",
                      hintText: "호수를 입력하세요.",
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    InputWidget(
                      title: "보증금/월세",
                      hintText: "보증금을 입력하세요.",
                    ),
                    InputWidget(
                      hintText: "월세를 입력하세요.",
                    ),
                  ],
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
                  "등록하기",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
