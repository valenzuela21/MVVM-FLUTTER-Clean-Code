import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  @JsonKey(name: 'access_token')
  AccessToken? accessToken;

  String? tokenType;

  @JsonKey(name: 'user_info')
  UserInfo? userInfo;

  AuthenticationResponse(
   this.accessToken,
   this.tokenType,
   this.userInfo,
  );

  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class AccessToken {
  @JsonKey(name: 'access_token')
  String? accessToken;

  AccessToken(this.accessToken);

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}

@JsonSerializable()
class UserInfo {
  String? email;
  String? fullname;

  UserInfo(this.email, this.fullname);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

