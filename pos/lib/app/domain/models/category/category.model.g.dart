// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      warehouse:
          WarehouseModel.fromJson(json['warehouse'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'warehouse': instance.warehouse,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
