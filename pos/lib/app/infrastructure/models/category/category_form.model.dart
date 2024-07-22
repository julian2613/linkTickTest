import 'package:flutter/material.dart';

class CategoryForm {
  final GlobalKey<FormState>? formController;
  final String? id;
  final TextEditingController? warehouseController;
  final TextEditingController? imageController;
  final TextEditingController? nameController;
  final TextEditingController? descriptionController;

  CategoryForm({
    required this.formController,
    required this.id,
    required this.warehouseController,
    required this.imageController,
    required this.nameController,
    required this.descriptionController,
  });
}
