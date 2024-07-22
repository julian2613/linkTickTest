import 'package:pos/shared/domain/models/pageable/pageable.model.dart';

abstract interface class CrudRepository<MODEL> {
  Future<MODEL> post({required MODEL model});
  Future<MODEL> put({required MODEL model});
  Future<List<MODEL>> getAll();
  Future<Pageable<MODEL>> getPageable({
    required int page,
    required int size,
  });
  Future<void> delete({required String id});
}
