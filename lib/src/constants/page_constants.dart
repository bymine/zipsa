import 'package:get/get.dart';
import 'package:zipsa_ui_design/src/app.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/sign_in_page.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/sign_up_page.dart';
import 'package:zipsa_ui_design/src/widgets/splash_screen.dart';

var pages = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/SignIn', page: () => const SignInPage()),
  GetPage(name: '/SignUp', page: () => const SignUpPage()),
  GetPage(name: '/App', page: () => const App())
];
