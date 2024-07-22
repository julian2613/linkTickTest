import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/controllers/warehouse.controller.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/pages/create_warehouse.page.dart';
import 'package:pos/shared/domain/models/table/table_column.model.dart';
import 'package:pos/shared/domain/models/table/table_column_type.enum.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/table/table.widget.dart';

class WarehousePage extends StatelessWidget {
  static const String name = 'warehouse';
  const WarehousePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<WarehouseController>()..getPageable();
    return BlocBuilder<WarehouseController, WarehouseState>(
      bloc: controller,
      builder: (context, state) {
        return state.pageable == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TableWidget<WarehouseModel>(
                title: 'Almacen',
                description:
                    'Crea un almacen para gestionar tu inventario en diferentes lugares de almacenamiento y distribución.',
                newLabel: 'Agregar',
                onNew: () {
                  controller.createForm();
                  context.goNamed(CreateWarehousePage.name);
                },
                onEdit: (WarehouseModel warehouse) {
                  controller.createForm(warehouse: warehouse);
                  context.goNamed(CreateWarehousePage.name);
                },
                onDelete: (id) => controller.delete(id),
                columns: const [
                  TableColumn(
                    id: '1',
                    key: ['name'],
                    label: 'Nombre',
                    type: TableColumnType.text,
                  ),
                  TableColumn(
                    id: '1',
                    key: ['address'],
                    label: 'Direccion',
                    type: TableColumnType.text,
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
