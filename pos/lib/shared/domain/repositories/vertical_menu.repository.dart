import 'package:pos/shared/domain/models/vertical_menu/vertical_menu.model.dart';
import 'package:pos/shared/domain/repositories/crud.repository.dart';

abstract interface class VerticalMenuRepository
    implements CrudRepository<VerticalMenuModel> {}
