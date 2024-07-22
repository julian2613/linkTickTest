import 'package:pos/app/domain/models/category/category.model.dart';
import 'package:pos/app/domain/repositories/category.repository.dart';
import 'package:pos/shared/infrastructure/repositories/crud/http/crud_http_repository.dart';

class CategoryHttpRepository extends CrudHttpRepository<CategoryModel>
    implements CategoryRepository {
  @override
  CategoryModel Function(Map<String, dynamic> json) mapper =
      CategoryModel.fromJson;

  @override
  String path = 'category';
}
