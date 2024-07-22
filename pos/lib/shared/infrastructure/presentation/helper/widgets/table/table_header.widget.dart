import 'package:flutter/material.dart';

class TableHeader extends StatelessWidget {
  final String? title;
  final String? description;
  final String? newLabel;
  final void Function()? onNew;

  const TableHeader({
    super.key,
    this.title,
    this.description,
    this.newLabel,
    this.onNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          runSpacing: 20,
          children: [
            if (description != null) Text(description!),
            if (newLabel != null)
              FilledButton.icon(
                label: Text(newLabel!),
                icon: const Icon(Icons.add_outlined),
                onPressed: onNew,
              ),
          ],
        )
      ],
    );
  }
}
