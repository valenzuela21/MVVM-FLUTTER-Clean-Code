class LoginRequest {
  String username;
  String password;

  LoginRequest(this.username, this.password);
}

class ProductsRequest {
  int page;
  int size;

  ProductsRequest(this.page, this.size);
}