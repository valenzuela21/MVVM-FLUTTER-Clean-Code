import 'package:approducts/data/responses/branches.response.dart';
import 'package:approducts/data/responses/category.respose.dart';
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
      this.items?.map((item) => domain.ProductItem(
        item.id,
        item.name,
        item.description,
        item.price,
        item.rating,
        domain.Brand(item.id, item.name),
        domain.Category(item.id, item.name),
        item.createdOn,
        item.updatedOn
      )).toList(),
      this.total,
      this.page,
      this.size,
      this.pages,
    );
  }
}

extension CategoryResponseMapper on CategoryResponse {
  List<Map<String, dynamic>> toDomain() {
    return items.map((item) {
      return {
        'id': item.id,
        'name': item.name,
      };
    }).toList();
  }
}

extension BranchesResponseMapper on BranchResponse {
  List<Map<String, dynamic>> toDomain() {
    return items.map((item) {
      return {
        'id': item.id,
        'name': item.name,
      };
    }).toList();
  }
}