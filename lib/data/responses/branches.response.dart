import 'package:json_annotation/json_annotation.dart';
part 'branches.response.g.dart';

@JsonSerializable()
class BranchResponse {
  final List<BranchItem> items;

  BranchResponse({required this.items});

  factory BranchResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BranchResponseToJson(this);
}


@JsonSerializable()
class BranchItem {
  final int id;
  final String name;

  BranchItem({
    required this.id,
    required this.name,
  });

  factory BranchItem.fromJson(Map<String, dynamic> json) => _$BranchItemFromJson(json);

  Map<String, dynamic> toJson() => _$BranchItemToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}