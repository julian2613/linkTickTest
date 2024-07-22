part of 'warehouse.controller.dart';

@immutable
sealed class WarehouseEvent {}

class CreateForm extends WarehouseEvent {
  final WarehouseModel? warehouse;

  CreateForm({this.warehouse});
}

class GetPageable extends WarehouseEvent {
  final int page;
  final int size;

  GetPageable({
    required page,
    required size,
  })  : page = page ?? 0,
        size = size ?? 10;
}

class Save extends WarehouseEvent {}

class Delete extends WarehouseEvent {
  final String id;

  Delete({
    required this.id,
  });
}
