import 'package:json_annotation/json_annotation.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';

part 'vertical_menu.model.g.dart';

@JsonSerializable()
class VerticalMenuModel extends Generic {
  final int? index;
  final String label;
  final String? url;
  final int? icon;
  final List<VerticalMenuModel>? children;

  const VerticalMenuModel({
    this.index,
    required this.label,
    this.url,
    this.icon,
    this.children,
  });

  factory VerticalMenuModel.fromJson(Map<String, dynamic> json) =>
      _$VerticalMenuModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerticalMenuModelToJson(this);
}
