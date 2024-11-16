class UserInfo {
  String? email;
  String? fullname;

  UserInfo(this.email, this.fullname);
}

class AccessToken {
  String? accessToken;

  AccessToken(this.accessToken);
}

class Authentication {
  AccessToken? accessToken;
  String? tokenType;
  UserInfo? userInfo;

  Authentication(this.accessToken, this.tokenType, this.userInfo);
}