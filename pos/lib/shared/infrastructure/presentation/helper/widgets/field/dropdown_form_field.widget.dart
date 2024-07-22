import 'package:flutter/material.dart';

class DropdownFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final List<DropdownMenuItem<String>> items;
  final String? Function(String?)? validator;

  const DropdownFormField({
    super.key,
    this.controller,
    required this.label,
    required this.items,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
      ),
      value: controller?.text != '' ? controller?.text : null,
      items: items,
      onChanged: (String? value) {
        controller?.text = value ?? '';
      },
      validator: validator,
    );
  }
}
