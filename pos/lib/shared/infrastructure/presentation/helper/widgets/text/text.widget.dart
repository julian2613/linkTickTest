import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  const TextWidget({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}
