import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zipsa_ui_design/src/constants/color_constants.dart';
import 'package:zipsa_ui_design/src/controllers/app_controller.dart';
import 'package:zipsa_ui_design/src/pages/board/board_page.dart';
import 'package:zipsa_ui_design/src/pages/book/book_main_page.dart';
import 'package:zipsa_ui_design/src/pages/home/home_page.dart';
import 'package:zipsa_ui_design/src/pages/setting/setting_main_page.dart';

enum Navigator { home, book, board, setting }

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _navigationBody()),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  Widget _navigationBody() {
    switch (Navigator.values[controller.index.value]) {
      case Navigator.home:
        return const HomePage();
      case Navigator.book:
        return const BookPage();

      case Navigator.board:
        return const BoardPage();

      case Navigator.setting:
        return const SettingPage();
    }
  }

  Widget _bottomNavigationBarWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          child: GNav(
              selectedIndex: controller.index.value,
              onTabChange: (index) {
                controller.changeIndex(index);
              },
              rippleColor:
                  Colors.grey[800]!, // tab button ripple color when pressed
              hoverColor: Colors.grey[700]!, // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              duration:
                  const Duration(milliseconds: 10), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Colors.grey[800], // unselected icon color
              activeColor: mainColor, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor:
                  mainColor.withOpacity(0.2), // selected tab background color
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 5), // navigation bar padding
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: '홈',
                ),
                GButton(
                  icon: LineIcons.wallet,
                  text: '가계부',
                ),
                GButton(
                  icon: LineIcons.list,
                  text: '게시판',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: '설정',
                )
              ]),
        ),
      ),
    );
  }
}
