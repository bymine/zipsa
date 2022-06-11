import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/app.dart';
import 'package:zipsa_ui_design/src/bindings/app_bindings.dart';
import 'package:zipsa_ui_design/src/bindings/mail_bindings.dart';
import 'package:zipsa_ui_design/src/pages/board/board_add_page.dart';
import 'package:zipsa_ui_design/src/pages/board/board_detail_page.dart';
import 'package:zipsa_ui_design/src/pages/book/book_search_page.dart';
import 'package:zipsa_ui_design/src/pages/home/house_add_page.dart';
import 'package:zipsa_ui_design/src/pages/home/mail_add_page.dart';
import 'package:zipsa_ui_design/src/pages/home/mail_detail_page.dart';
import 'package:zipsa_ui_design/src/pages/home/mail_main_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/change_pw_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/find_id_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/find_pw_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/show_id_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/sign_in_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/sign_up_page.dart';
import 'package:zipsa_ui_design/src/pages/setting/setting_edit_account_page.dart';
import 'package:zipsa_ui_design/src/pages/setting/setting_edit_user_page.dart';
import 'package:zipsa_ui_design/src/widgets/splash_screen.dart';

var pages = [
  //onboard
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/SignIn', page: () => const SignInPage()),
  GetPage(name: '/SignUp', page: () => const SignUpPage()),
  GetPage(name: '/FindId', page: () => const FindIdPage()),
  GetPage(name: '/FindPw', page: () => const FindPwPage()),
  GetPage(name: '/ShowId', page: () => const ShowIdPage()),
  GetPage(name: '/ChangePw', page: () => const ChangePwPage()),

  // app
  GetPage(name: '/App', page: () => const App(), binding: AppBindings()),

  // home
  GetPage(name: '/AddHouse', page: () => const AddHousePage()),
  GetPage(
      name: '/Mail', page: () => const MailMainPage(), binding: MailBindings()),
  GetPage(name: '/MailDetail', page: () => const MailDetailPage()),
  GetPage(name: '/MailAdd', page: () => const MailAddPage()),

  // book
  GetPage(name: '/BookSearch', page: () => const BookSearchPage()),

  // board
  GetPage(name: '/BoardDetail', page: () => const BoardDetailPage()),
  GetPage(name: '/BoardAdd', page: () => const BoardAddPage()),

  // setting
  GetPage(name: '/EditAccount', page: () => const EditAccountPage()),
  GetPage(name: '/EditUser', page: () => const SettingEditUserPage())
];
