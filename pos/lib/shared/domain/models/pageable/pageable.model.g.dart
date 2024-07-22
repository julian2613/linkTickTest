// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pageable<MODEL> _$PageableFromJson<MODEL>(
  Map<String, dynamic> json,
  MODEL Function(Object? json) fromJsonMODEL,
) =>
    Pageable<MODEL>(
      content: (json['content'] as List<dynamic>).map(fromJsonMODEL).toList(),
      size: (json['size'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
    );

Map<String, dynamic> _$PageableToJson<MODEL>(
  Pageable<MODEL> instance,
  Object? Function(MODEL value) toJsonMODEL,
) =>
    <String, dynamic>{
      'content': instance.content.map(toJsonMODEL).toList(),
      'size': instance.size,
      'number': instance.number,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
    };
