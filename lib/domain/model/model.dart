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

  // Método toMap para convertir el objeto a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'brand_id': brand?.id,
      'category_id': category?.id,
      'created_on': DateTime.now().toIso8601String(),
      'updated_on': DateTime.now().toIso8601String(),
    };
  }

}



class Brand {
  int? id;
  String? name;

  Brand(this.id, this.name);

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Category {
  int? id;
  String? name;

  Category(this.id, this.name);

  @override
  String toString() {
    return 'Brand{id: $id, name: $name}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}




