import 'package:pos/app/domain/models/category/category.model.dart';
import 'package:pos/shared/domain/repositories/crud.repository.dart';

abstract interface class CategoryRepository
    implements CrudRepository<CategoryModel> {}
