import 'package:approducts/data/responses/responses.dart';
import 'package:approducts/domain/model/model.dart' as domain;

const EMPTY = "";
const ZERO = 0;


extension AuthenticationResponseMapper on AuthenticationResponse {
  domain.Authentication toDomain() {
    return domain.Authentication(
      this.accessToken != null ? domain.AccessToken(this.accessToken!.accessToken) : null,
      this.tokenType,
      this.userInfo != null ? domain.UserInfo(this.userInfo!.email, this.userInfo!.fullname) : null,
    );
  }
}