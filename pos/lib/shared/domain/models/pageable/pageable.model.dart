import 'package:json_annotation/json_annotation.dart';

part 'pageable.model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Pageable<MODEL> {
  final List<MODEL> content;
  final int size;
  final int number;
  final int totalPages;
  final int totalElements;

  const Pageable({
    required this.content,
    required this.size,
    required this.number,
    required this.totalPages,
    required this.totalElements,
  });

  factory Pageable.fromJson(
          Map<String, dynamic> json, MODEL Function(Object? json) fromJson) =>
      _$PageableFromJson(json, fromJson);

  Map<String, dynamic> toJson(
          Map<String, dynamic> Function(MODEL value) toJson) =>
      _$PageableToJson(this, toJson);
}
