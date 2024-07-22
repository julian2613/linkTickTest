import 'package:json_annotation/json_annotation.dart';
import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';

part 'category.model.g.dart';

@JsonSerializable()
class CategoryModel extends Generic {
  final WarehouseModel warehouse;
  final String? id;
  final String name;
  final String? description;
  final String? image;

  const CategoryModel({
    required this.warehouse,
    this.id,
    required this.name,
    this.description,
    this.image,
  }) : super();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
