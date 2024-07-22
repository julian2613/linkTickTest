import 'package:pos/shared/domain/models/table/table_column_type.enum.dart';

class TableColumn {
  final String id;
  final List<String> key;
  final String label;
  final TableColumnType type;

  const TableColumn({
    required this.id,
    required this.key,
    required this.label,
    required this.type,
  });
}
