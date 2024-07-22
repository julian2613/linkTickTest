import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/app/domain/models/category/category.model.dart';
import 'package:pos/app/infrastructure/presentation/category/controllers/bloc/category.controller.dart';
import 'package:pos/app/infrastructure/presentation/category/pages/create_category.page.dart';
import 'package:pos/shared/domain/models/table/table_column.model.dart';
import 'package:pos/shared/domain/models/table/table_column_type.enum.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/table/table.widget.dart';

class CategoryPage extends StatelessWidget {
  static const String name = 'category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CategoryController>()..getPageable();
    return BlocBuilder<CategoryController, CategoryState>(
      bloc: controller,
      builder: (context, state) {
        return state.pageable == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TableWidget<CategoryModel>(
                title: 'Categorias',
                description:
                    'Crea categorías para agrupar tus productos según su clase o tipo.',
                newLabel: 'Agregar',
                onNew: () {
                  controller.createForm();
                  context.goNamed(CreateCategoryPage.name);
                },
                onEdit: (CategoryModel category) {
                  controller.createForm(category: category);
                  context.goNamed(CreateCategoryPage.name);
                },
                onDelete: (id) => controller.delete(id),
                columns: const [
                  TableColumn(
                    id: '1',
                    key: ['warehouse', 'name'],
                    label: 'Almacen',
                    type: TableColumnType.text,
                  ),
                  TableColumn(
                    id: '2',
                    key: ['name'],
                    label: 'Nombre',
                    type: TableColumnType.text,
                  ),
                  TableColumn(
                    id: '3',
                    key: ['description'],
                    label: 'Descripcion',
                    type: TableColumnType.text,
                  ),
                  TableColumn(
                    id: '4',
                    key: ['image'],
                    label: 'Imagen',
                    type: TableColumnType.image,
                  ),
                ],
                pageable: state.pageable!,
                onNumberChange: (int number) =>
                    controller.getPageable(page: number),
              );
      },
    );
  }
}
