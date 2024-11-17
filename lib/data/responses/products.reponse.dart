import 'package:json_annotation/json_annotation.dart';
part 'products.reponse.g.dart';

@JsonSerializable()
class ProductListResponse {
  List<ProductItem>? items;
  int? total;
  int? page;
  int? size;
  int? pages;

  ProductListResponse(this.items, this.total, this.page, this.size, this.pages);

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}

@JsonSerializable()
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

  ProductItem({
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.brand,
    this.category,
    this.createdOn,
    this.updatedOn,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class Brand {
  int? id;
  String? name;

  Brand(this.id, this.name);

  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Category {
  int? id;
  String? name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
