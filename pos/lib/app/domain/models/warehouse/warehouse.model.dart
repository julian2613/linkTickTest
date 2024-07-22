import 'package:json_annotation/json_annotation.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';

part 'warehouse.model.g.dart';

@JsonSerializable()
class WarehouseModel extends Generic {
  final String? id;
  final String? name;
  final String? address;

  const WarehouseModel({
    this.id,
    this.name,
    this.address,
  }) : super();

  factory WarehouseModel.fromJson(Map<String, dynamic> json) =>
      _$WarehouseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WarehouseModelToJson(this);
}
