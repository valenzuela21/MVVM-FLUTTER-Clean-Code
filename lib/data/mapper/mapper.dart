import 'package:approducts/data/responses/product.responses.dart';
import 'package:approducts/data/responses/products.reponse.dart';
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


extension ProductsResponseMapper on ProductListResponse {
  domain.Products toDomain() {
    return domain.Products(
      items: this.items?.map((item) => ProductItem(
        id: item.id,
        name: item.name,
        description: item.description,
        price: item.price,
        rating: item.rating,
        brand: item.brand != null
            ? Brand(item.brand?.id, item.brand?.name)
            : null,
        category: item.category != null
            ? Category(item.category?.id, item.category?.name)
            : null,
        createdOn: item.createdOn,
        updatedOn: item.updatedOn,
      )).toList() ?? [],
      total: this.total,
      page: this.page,
      size: this.size,
      pages: this.pages,
    );
  }
}