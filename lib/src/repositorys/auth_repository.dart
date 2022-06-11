import 'package:get/get.dart';

class AuthRepository extends GetConnect {
  static AuthRepository get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://15.165.44.195:8080/api';
    // httpClient.addAuthenticator<dynamic>((request) async {
    //   request.headers['Authorization'] = "Bearer";
    //   return request;
    // });
  }

  Future<Response> signIn(Map<String, dynamic> body) {
    return post("/user/login", body, headers: {'Authorization': 'Bearer'});
  }

  Future<Response> signUp(Map<String, dynamic> body) {
    return post('/user/join', body, headers: {'Authorization': 'Bearer'});
  }

  Future<Response> requestUserIdNickname() =>
      get('/user/join', headers: {'Authorization': 'Bearer'});

  Future<Response> requestVerificationNumber(String phone, String type) =>
      get('/user/phone?userPhone=$phone&type=$type',
          headers: {'Authorization': 'Bearer'});

  Future<Response> confirmationVerificationNumber(String phone, String code) =>
      post(
        '/user/phone',
        FormData({"userPhone": phone, "code": code}),
        headers: {'Authorization': 'Bearer'},
      );

  Future<Response> findId(Map<String, dynamic> body) =>
      post("/user/find/id", body, headers: {'Authorization': 'Bearer'});

  Future<Response> findPw(Map<String, dynamic> body) =>
      post("/user/find/pw", body, headers: {'Authorization': 'Bearer'});

  Future<Response> changePw(Map<String, String> body) =>
      patch("/user/pw", body, headers: {'Authorization': 'Bearer'});
}
