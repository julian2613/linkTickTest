import 'package:flutter/material.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';

class TablePaginationWidget<MODEL> extends StatelessWidget {
  final Pageable<MODEL> pageable;
  final void Function(int number) onNumberChange;

  const TablePaginationWidget({
    super.key,
    required this.pageable,
    required this.onNumberChange,
  });

  List<Widget> _getPages() {
    List<Widget> pages = List.generate(
      pageable.totalPages,
      (index) => IconButton(
        icon: Text('${index + 1}'),
        onPressed:
            pageable.number == index ? null : () => onNumberChange(index),
      ),
    );

    pages.insert(
      0,
      IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left_outlined,
        ),
        onPressed: pageable.number == 0
            ? null
            : () => onNumberChange(pageable.number - 1),
      ),
    );

    pages.add(
      IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
        onPressed: pageable.number == pageable.totalPages - 1
            ? null
            : () => onNumberChange(pageable.number + 1),
      ),
    );
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _getPages(),
    );
  }
}
