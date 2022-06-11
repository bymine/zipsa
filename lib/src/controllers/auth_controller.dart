import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipsa_ui_design/src/models/result_api.dart';
import 'package:zipsa_ui_design/src/pages/onboarding/find_pw_page.dart';
import 'package:zipsa_ui_design/src/repositorys/auth_repository.dart';

class AuthController extends GetxController {
  GetStorage box = GetStorage();
  RxInt count = 0.obs;

  // Variables SignIn
  Rx<ApiResult> signUpRequestCode =
      ApiResult(status: "INIT", detail: "INIT").obs;
  Rx<ApiResult> signUpVerifyCode =
      ApiResult(status: "INIT", detail: "INIT").obs;

  Rx<ApiResult> findIdVerifyPhone =
      ApiResult(status: "INIT", detail: "INIT").obs;
  Rx<ApiResult> findIdConfirmCode =
      ApiResult(status: "INIT", detail: "INIT").obs;
  Rx<ApiResult> findIdResponse = ApiResult(status: "INIT", detail: "INIT").obs;

  Rx<ApiResult> findPwVerifyPhone =
      ApiResult(status: "INIT", detail: "INIT").obs;
  Rx<ApiResult> findPwConfirmCode =
      ApiResult(status: "INIT", detail: "INIT").obs;
  Rx<ApiResult> findPwResponse = ApiResult(status: "INIT", detail: "INIT").obs;

  Rx<ApiResult> changePwResponse =
      ApiResult(status: "INIT", detail: "INIT").obs;

  @override
  void onReady() {
    super.onReady();
    count.bindStream(Stream.value(isCount));
    ever(count, (int value) {
      if (value == 0) {
        Get.offAllNamed('/SignIn');
      } else {
        Get.offAllNamed('/App');
      }
    });
  }

  int get isCount => box.read('count') ?? 0;

  //Variables SignIn
  Rx<ApiResult> signInResponse = ApiResult(status: "INIT", detail: "INIT").obs;
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  // Variables SignUp
  Rx<ApiResult> requestUserIdNickname =
      ApiResult(status: "INIT", detail: "INIT").obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpRePassword = TextEditingController();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpNickname = TextEditingController();
  TextEditingController signUpBirth = TextEditingController();
  TextEditingController signUpPhone = TextEditingController();
  TextEditingController signUpCode = TextEditingController();

  RxBool allMarket = false.obs;
  RxBool smsMarket = false.obs;
  RxBool mailMarket = false.obs;

  RxBool allAgree = false.obs;
  RxBool useAgree = false.obs;
  RxBool infoAgree = false.obs;
  RxBool ageAgree = false.obs;

  //Variables FindId
  GlobalKey<FormState> findIdFormKey = GlobalKey<FormState>();
  TextEditingController findIdName = TextEditingController();
  TextEditingController findIdBirth = TextEditingController();
  TextEditingController findIdPhone = TextEditingController();
  TextEditingController findIdCode = TextEditingController();

  //Variables FindPassword
  GlobalKey<FormState> findPwFormKey = GlobalKey<FormState>();
  TextEditingController findPwEmail = TextEditingController();
  TextEditingController findPwName = TextEditingController();
  TextEditingController findPwBirth = TextEditingController();
  TextEditingController findPwPhone = TextEditingController();
  TextEditingController findPwCode = TextEditingController();

  //Variables ChangePassword
  GlobalKey<FormState> changePwFormKey = GlobalKey<FormState>();
  TextEditingController changePw = TextEditingController();
  TextEditingController changeRePw = TextEditingController();

  bool get activeSignIn {
    if (signInEmail.text.isNotEmpty && signInPassword.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get activeSignUp {
    if (allAgree.value ||
        (useAgree.value && infoAgree.value && ageAgree.value)) {
      return true;
    } else {
      return false;
    }
  }

  void signIn() async {
    if (signInFormKey.currentState!.validate()) {
      debugPrint('Sign In Api');
      var body = {"userId": signInEmail.text, "userPw": signInPassword.text};
      var data = await AuthRepository.to.signIn(body);
      signInResponse(ApiResult.fromJson(data.body, signin));

      if (signInResponse.value.status == "SUCCESS") {
        Get.offAllNamed('/App');
      } else {
        Get.dialog(const AlertMessage(
          message: "로그인 정보가 올바르지 않습니다",
        ));
      }
    }
  }

  void signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      var body = {
        "userId": signUpEmail.text,
        "userPw": signUpPassword.text,
        "userName": signUpName.text,
        "userNickname": signUpNickname.text,
        "userBirth": formatBirth(signUpBirth.text),
        "isAlert": true,
        "isMarketingSMS": smsMarket.value,
        "isMarketingEmail": mailMarket.value,
        "userPhone": formatPhoneNumber(signUpPhone.text)
      };

      var data = await AuthRepository.to.signUp(body);
    }
  }

  void getUserIdNickname() async {
    if (requestUserIdNickname.value.status == "Init") {
      debugPrint('Join Data Api');
      Response data = await AuthRepository.to.requestUserIdNickname();
      requestUserIdNickname(ApiResult.fromJson(data.body, userIdNickName));
    }
  }

  void requestVerificationNumber(String type) async {
    switch (type) {
      case "SignUp":
        if (signUpPhone.text.isNotEmpty) {
          signUpRequestCode(ApiResult(status: "INIT", detail: "INIT"));
          debugPrint('SignUp Request Code Api');
          Response data = await AuthRepository.to.requestVerificationNumber(
              formatPhoneNumber(signUpPhone.text), "JOIN");

          signUpRequestCode(ApiResult.fromJson(data.body, null));
        }
        break;

      case "FindId":
        if (findIdFormKey.currentState!.validate()) {
          findIdResponse(ApiResult(status: "INIT", detail: "INIT"));
          var body = {
            "userName": findIdName.text,
            "userBirth": formatBirth(findIdBirth.text),
            "userPhone": formatPhoneNumber(findIdPhone.text)
          };

          Response data = await AuthRepository.to.findId(body);
          findIdResponse(ApiResult.fromJson(data.body, null));

          debugPrint('FindId Api');

          // User Info is Correct, then Send SMS Code
          if (findIdResponse.value.status == success) {
            Response data = await AuthRepository.to.requestVerificationNumber(
                formatPhoneNumber(findIdPhone.text), "NONE");
            findIdVerifyPhone(ApiResult.fromJson(data.body, null));
            Get.dialog(const AlertMessage(
              message: "SMS 인증 코드가 발송되었습니다.",
            ));
          } else {
            Get.dialog(const AlertMessage(
              message: "입력하신 정보가 올바르지 않습니다.",
            ));
          }
        }
        break;

      case "FindPw":
        if (findPwFormKey.currentState!.validate()) {
          findPwResponse(ApiResult(status: "INIT", detail: "INIT"));

          var body = {
            "userId": findPwEmail.text,
            "userName": findPwName.text,
            "userBirth": formatBirth(findPwBirth.text),
            "userPhone": formatPhoneNumber(findPwPhone.text)
          };

          Response data = await AuthRepository.to.findPw(body);
          findPwResponse(ApiResult.fromJson(data.body, null));

          if (findPwResponse.value.status == success) {
            Response data = await AuthRepository.to.requestVerificationNumber(
                formatPhoneNumber(findPwPhone.text), "NONE");
            findPwVerifyPhone(ApiResult.fromJson(data.body, null));

            Get.dialog(const AlertMessage(
              message: "SMS 인증 코드가 발송되었습니다.",
            ));
          } else {
            Get.dialog(const AlertMessage(
              message: "입력하신 정보가 올바르지 않습니다.",
            ));
          }
        }
        break;
    }
  }

  void confirmationVerificationNumber(String type) async {
    switch (type) {
      case "SignUp":
        if (signUpCode.text.isNotEmpty) {
          debugPrint('SignUp Confirm Number Api');
          Response data = await AuthRepository.to
              .confirmationVerificationNumber(
                  formatPhoneNumber(signUpPhone.text), signUpCode.text);
          signUpVerifyCode(ApiResult.fromJson(data.body, null));
        }
        break;

      case "FindId":
        if (findIdCode.text.isNotEmpty) {
          debugPrint('FindId Confirm Number Api');
          Response data = await AuthRepository.to
              .confirmationVerificationNumber(
                  formatPhoneNumber(findIdPhone.text), findIdCode.text);
          findIdConfirmCode(ApiResult.fromJson(data.body, null));
          if (findIdConfirmCode.value.status == "SUCCESS") {
            Get.offAllNamed('/ShowId');
          } else {
            Get.dialog(const AlertMessage(
              message: "인증번호가 올바르지 않습니다.",
            ));
          }
        } else {
          Get.dialog(const AlertMessage(
            message: "인증번호를 입력하세요.",
          ));
        }
        break;
      case "FindPw":
        if (findPwCode.text.isNotEmpty) {
          debugPrint('FindPassword Confirm Number Api');
          Response data = await AuthRepository.to
              .confirmationVerificationNumber(
                  formatPhoneNumber(findPwPhone.text), findPwCode.text);
          findPwConfirmCode(ApiResult.fromJson(data.body, null));
          if (findPwConfirmCode.value.status == "SUCCESS") {
            Get.offAllNamed('/ChangePw');
          } else {
            Get.dialog(const AlertMessage(
              message: "인증번호가 올바르지 않습니다.",
            ));
          }
        } else {
          Get.dialog(const AlertMessage(
            message: "인증번호를 입력하세요.",
          ));
        }

        break;
    }
  }

  void changePwfunc() async {
    var body = {"userId": findPwEmail.text, "userPw": changePw.text};

    Response data = await AuthRepository.to.changePw(body);
    changePwResponse(ApiResult.fromJson(data.body, null));

    if (changePwResponse.value.status == "SUCCESS") {
      Get.offAllNamed('/SignIn');
    }
  }

  void marketCheck(String type) {
    switch (type) {
      case "sms":
        smsMarket.value = !smsMarket.value;
        break;
      case "mail":
        mailMarket.value = !mailMarket.value;
        break;

      case "all":
        allMarket.value = !allMarket.value;
        smsMarket.value = allMarket.value;
        mailMarket.value = allMarket.value;
        break;
    }
  }

  void agreeCheck(String type) {
    switch (type) {
      case "use":
        useAgree.value = !useAgree.value;
        break;
      case "info":
        infoAgree.value = !infoAgree.value;
        break;

      case "age":
        ageAgree.value = !ageAgree.value;
        break;

      case "all":
        allAgree.value = !allAgree.value;
        useAgree.value = allAgree.value;
        infoAgree.value = allAgree.value;
        ageAgree.value = allAgree.value;
        break;
    }
  }

  bool duplicateEmail(String email) {
    return requestUserIdNickname.value.detail
        .any((element) => element.userId == email);
  }

  bool duplicateNickName(String nickname) {
    bool isDuplication = requestUserIdNickname.value.detail
        .any((element) => element.userNickname == nickname);
    return isDuplication;
  }

  String formatPhoneNumber(String number) {
    String left;
    String middle;
    String right;

    if (number.length == 10) {
      left = number.substring(0, 3);
      middle = number.substring(3, 6);
      right = number.substring(6);
    } else {
      left = number.substring(0, 3);
      middle = number.substring(3, 7);
      right = number.substring(7);
    }

    return "$left-$middle-$right";
  }

  String formatBirth(String birth) {
    String year = birth.substring(0, 4);
    String month = birth.substring(4, 6);
    String day = birth.substring(6);
    //19970723
    return "$year-$month-$day";
  }

  String formatEmail(String email) {
    var user = email.split('@').first;
    var domain = email.split('@').last;

    user = user.replaceRange(user.length - 2, null, "**");
    return "$user@$domain";
  }
}
