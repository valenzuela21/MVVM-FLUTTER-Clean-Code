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

class Products {
  List<ProductItem>? items;
  int? total;
  int? page;
  int? size;
  int? pages;

  Products(this.items, this.total, this.page, this.size, this.pages);

}

class ProductItem {
  int? id;
  String? name;
  String? description;
  double? price;
  double? rating;
  Brand? brand;
  Category? category;
  DateTime? createdOn;
  DateTime? updatedOn;

  ProductItem(
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.brand,
    this.category,
    this.createdOn,
    this.updatedOn,
  );
}



class Brand {
  int? id;
  String? name;

  Brand(this.id, this.name);
}

class Category {
  int? id;
  String? name;

  Category(this.id, this.name);
}




