import 'package:flutter/material.dart';

class WarehouseForm {
  final GlobalKey<FormState>? formController;
  final String? id;
  final TextEditingController? nameController;
  final TextEditingController? addressController;

  WarehouseForm({
    required this.formController,
    required this.id,
    required this.nameController,
    required this.addressController,
  });
}
