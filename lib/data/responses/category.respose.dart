import 'package:json_annotation/json_annotation.dart';
part 'category.respose.g.dart';

@JsonSerializable()
class CategoryResponse {
  final List<CategoryItem> items;

  CategoryResponse({required this.items});

  factory CategoryResponse.fromJson(List<dynamic> json) {
    return CategoryResponse(
      items: json.map((e) => CategoryItem.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() => items.map((e) => e.toJson()).toList();
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