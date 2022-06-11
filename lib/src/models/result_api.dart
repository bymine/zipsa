const success = "SUCCESS";
const fail = "FAIL";

const signin = "SIGNIN";
const userIdNickName = "REQUREST_USERIDNICKNAME";

class ApiResult {
  ApiResult({
    required this.status,
    required this.detail,
  });

  String status;
  dynamic detail;

  factory ApiResult.fromJson(Map<String, dynamic> json, String? detailType) {
    dynamic detail;

    if (json['status'] == success) {
      switch (detailType) {
        case signin:
          detail = Token.fromJson(json['detail']);
          break;

        case userIdNickName:
          detail = UserIdAndNickName.fromJson(json['detail']);
          break;

        default:
          detail = json['detail'];
      }
    } else {
      detail = json['detail'];
    }

    return ApiResult(status: json["status"], detail: detail);
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "detail": detail,
      };
}

class Token {
  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class UserIdAndNickName {
  UserIdAndNickName({
    required this.userId,
    required this.userNickname,
  });

  String userId;
  String userNickname;

  factory UserIdAndNickName.fromJson(Map<String, dynamic> json) =>
      UserIdAndNickName(
        userId: json["userId"],
        userNickname: json["userNickname"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userNickname": userNickname,
      };
}
