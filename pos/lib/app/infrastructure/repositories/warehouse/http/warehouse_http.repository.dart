import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/app/domain/repositories/warehouse.repository.dart';
import 'package:pos/shared/infrastructure/repositories/crud/http/crud_http_repository.dart';

class WarehouseHttpRepository extends CrudHttpRepository<WarehouseModel>
    implements WarehouseRepository {
  @override
  WarehouseModel Function(Map<String, dynamic> json) mapper =
      WarehouseModel.fromJson;

  @override
  String path = 'warehouse';
}
