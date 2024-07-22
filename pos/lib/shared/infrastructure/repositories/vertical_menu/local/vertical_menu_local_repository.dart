import 'package:pos/shared/domain/models/pageable/pageable.model.dart';
import 'package:pos/shared/domain/models/vertical_menu/vertical_menu.model.dart';
import 'package:pos/shared/domain/repositories/vertical_menu.repository.dart';

class VerticalMenuLocalRepository implements VerticalMenuRepository {
  @override
  Future<VerticalMenuModel> post({required VerticalMenuModel model}) {
    throw UnimplementedError();
  }

  @override
  Future<VerticalMenuModel> put({required VerticalMenuModel model}) {
    throw UnimplementedError();
  }

  @override
  Future<List<VerticalMenuModel>> getAll() {
    return Future.sync(() => [
          const VerticalMenuModel(
            label: 'Inventario',
            children: [
              VerticalMenuModel(
                index: 0,
                label: 'Almacenes',
                url: 'warehouse',
                icon: 0xf0693,
              ),
              VerticalMenuModel(
                index: 1,
                label: 'Categorias',
                url: 'category',
                icon: 0xe148,
              )
            ],
          )
        ]);
  }

  @override
  Future<Pageable<VerticalMenuModel>> getPageable(
      {required int page, required int size}) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required String id}) {
    throw UnimplementedError();
  }
}
