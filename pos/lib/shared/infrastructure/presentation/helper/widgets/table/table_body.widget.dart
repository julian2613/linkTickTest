import 'package:flutter/material.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';
import 'package:pos/shared/domain/models/table/table_column.model.dart';
import 'package:pos/shared/domain/models/table/table_column_type.enum.dart';
import 'package:pos/shared/infrastructure/presentation/helper/utils/number_format.helper.dart';

class TableBodyWidget<MODEL extends Generic> extends StatelessWidget {
  final void Function(MODEL model)? onEdit;
  final void Function(String id)? onDelete;
  final List<TableColumn> columns;
  final Pageable<MODEL> pageable;

  const TableBodyWidget({
    super.key,
    this.onEdit,
    this.onDelete,
    required this.columns,
    required this.pageable,
  });

  TableRow _getHeader() => TableRow(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(),
          ),
        ),
        children: [
          ...columns.map(
            (column) => TableCell(
              child: Center(
                child: Text(column.label),
              ),
            ),
          ),
          const TableCell(
            child: Center(
              child: Text('Acciones'),
            ),
          ),
        ],
      );

  dynamic _getObjectValue(List<String> keys, Generic row) {
    var key = List.of(keys);
    var value = row.get(key[0]);
    key.removeAt(0);
    if (key.isNotEmpty) {
      value = _getObjectValue(key, value);
    }
    return value;
  }

  /*List<dynamic> _getListValue(List<String> keys, Generic row) =>
      row.get(keys[0]);*/

  Widget _getField(TableColumn column, Generic row) {
    var widget = Container();
    var value = _getObjectValue(column.key, row);
    switch (column.type) {
      case TableColumnType.image:
        var value = _getObjectValue(column.key, row);
        return value != null
            ? Image.network(
                value,
                height: 50,
              )
            : Container();
      case TableColumnType.money:
        return Text(
          NumberFormatHelper.toCurrency(
            _getObjectValue(column.key, row),
          ),
        );
      case TableColumnType.text:
        return value == null ? widget : Text(value);
      /*case TableColumnType.chips:
        return OverflowBar(
          spacing: 15,
          children: _getListValue(column.key, row)
              .map(
                (dynamic object) => Chip(
                  label: Text(
                    _getObjectValue(
                        column.key
                            .where(
                                (element) => column.key.indexOf(element) != 0)
                            .toList(),
                        object),
                  ),
                ),
              )
              .toList(),
        );*/
      default:
        return widget;
    }
  }

  List<TableRow> _getData() => pageable.content
      .map(
        (MODEL row) => TableRow(
          children: [
            ...columns.map(
              (column) => _getField(column, row),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.mode_edit_outline_outlined,
                  ),
                  onPressed: onEdit == null
                      ? null
                      : () {
                          onEdit!(row);
                        },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                  ),
                  onPressed: onDelete == null
                      ? null
                      : () {
                          onDelete!(row.get('id'));
                        },
                ),
              ],
            )
          ],
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        _getHeader(),
        ..._getData(),
      ],
    );
  }
}
