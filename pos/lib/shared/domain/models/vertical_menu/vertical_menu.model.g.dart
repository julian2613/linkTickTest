// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertical_menu.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerticalMenuModel _$VerticalMenuModelFromJson(Map<String, dynamic> json) =>
    VerticalMenuModel(
      index: (json['index'] as num?)?.toInt(),
      label: json['label'] as String,
      url: json['url'] as String?,
      icon: (json['icon'] as num?)?.toInt(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => VerticalMenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VerticalMenuModelToJson(VerticalMenuModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'label': instance.label,
      'url': instance.url,
      'icon': instance.icon,
      'children': instance.children,
    };
