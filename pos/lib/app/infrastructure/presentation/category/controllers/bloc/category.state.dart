part of 'category.controller.dart';

@immutable
sealed class CategoryState {
  Pageable<CategoryModel>? get pageable => null;
  CategoryForm? get form => null;
  List<WarehouseModel>? get warehouses => null;

  ManagementCategoryState copyWith({
    Pageable<CategoryModel>? pageable,
    List<WarehouseModel>? warehouses,
    CategoryForm? form,
  });
}

final class ManagementCategoryState extends CategoryState {
  @override
  final Pageable<CategoryModel>? pageable;

  @override
  final List<WarehouseModel>? warehouses;

  @override
  final CategoryForm? form;

  ManagementCategoryState({
    this.pageable,
    this.form,
    this.warehouses,
  });

  @override
  ManagementCategoryState copyWith({
    Pageable<CategoryModel>? pageable,
    List<WarehouseModel>? warehouses,
    CategoryForm? form,
  }) {
    return ManagementCategoryState(
      pageable: pageable ?? this.pageable,
      warehouses: warehouses ?? this.warehouses,
      form: form ?? this.form,
    );
  }
}
