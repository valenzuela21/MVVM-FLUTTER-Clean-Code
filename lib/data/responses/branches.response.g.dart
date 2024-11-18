// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchResponse _$BranchResponseFromJson(Map<String, dynamic> json) =>
    BranchResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => BranchItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchResponseToJson(BranchResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

BranchItem _$BranchItemFromJson(Map<String, dynamic> json) => BranchItem(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$BranchItemToJson(BranchItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
