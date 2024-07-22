import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/shared/domain/repositories/crud.repository.dart';

abstract interface class WarehouseRepository
    implements CrudRepository<WarehouseModel> {}
