import 'package:json_annotation/json_annotation.dart';
part 'category.respose.g.dart';

@JsonSerializable()
class CategoryResponse {
  final List<CategoryItem> items;

  CategoryResponse({required this.items});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}


@JsonSerializable()
class CategoryItem {
  final int id;
  final String name;

  CategoryItem({
    required this.id,
    required this.name,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) => _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}