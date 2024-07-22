part of 'warehouse.controller.dart';

@immutable
sealed class WarehouseState {
  Pageable<WarehouseModel>? get pageable => null;
  WarehouseForm? get form => null;

  ManagementWarehouseState copyWith({
    Pageable<WarehouseModel>? pageable,
    WarehouseForm? form,
  });
}

class ManagementWarehouseState extends WarehouseState {
  @override
  final Pageable<WarehouseModel>? pageable;

  @override
  final WarehouseForm? form;

  ManagementWarehouseState({this.pageable, this.form});

  @override
  ManagementWarehouseState copyWith({
    Pageable<WarehouseModel>? pageable,
    WarehouseForm? form,
  }) {
    return ManagementWarehouseState(
      pageable: pageable ?? this.pageable,
      form: form ?? this.form,
    );
  }
}
