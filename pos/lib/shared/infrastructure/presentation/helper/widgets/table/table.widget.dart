import 'package:flutter/material.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';
import 'package:pos/shared/domain/models/table/table_column.model.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/table/table_body.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/table/table_header.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/table/table_pagination.widget.dart';

class TableWidget<MODEL extends Generic> extends StatelessWidget {
  final String? title;
  final String? description;
  final String? newLabel;
  final void Function()? onNew;
  final void Function(MODEL model)? onEdit;
  final void Function(String id)? onDelete;
  final List<TableColumn> columns;
  final Pageable<MODEL> pageable;
  final void Function(int number) onNumberChange;

  const TableWidget({
    super.key,
    this.title,
    this.description,
    this.newLabel,
    this.onNew,
    this.onEdit,
    this.onDelete,
    required this.columns,
    required this.pageable,
    required this.onNumberChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHeader(
          title: title,
          description: description,
          newLabel: newLabel,
          onNew: onNew,
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        TableBodyWidget<MODEL>(
          onEdit: onEdit,
          onDelete: onDelete,
          columns: columns,
          pageable: pageable,
        ),
        TablePaginationWidget<MODEL>(
          pageable: pageable,
          onNumberChange: onNumberChange,
        ),
      ],
    );
  }
}
