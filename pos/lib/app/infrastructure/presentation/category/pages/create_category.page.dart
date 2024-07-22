import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/app/infrastructure/presentation/category/controllers/bloc/category.controller.dart';
import 'package:pos/app/infrastructure/presentation/category/pages/category.page.dart';
import 'package:pos/shared/infrastructure/presentation/helper/utils/validator.helper.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/field/dropdown_form_field.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/field/image_form_field.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/field/text_form_field.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/text/text.widget.dart';

class CreateCategoryPage extends StatelessWidget {
  static const String name = 'category/create';

  const CreateCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CategoryController>()..getAllWarehouses();
    return BlocBuilder<CategoryController, CategoryState>(
      bloc: controller,
      builder: (context, state) {
        return Form(
          key: state.form?.formController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextWidget(
                label: state.form?.id == null
                    ? 'Nueva categoria'
                    : 'Editar categoria',
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              ImageFormFieldWidget(
                controller: state.form?.imageController,
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              if (state.warehouses != null)
                DropdownFormField(
                  controller: state.form?.warehouseController,
                  label: 'Almacen *',
                  items: state.warehouses!
                      .map(
                        (WarehouseModel warehouse) => DropdownMenuItem<String>(
                          value: warehouse.id,
                          child: Text(warehouse.name!),
                        ),
                      )
                      .toList(),
                  validator: ValidatorHelper.required,
                ),
              TextFormFieldWidget(
                controller: state.form?.nameController,
                label: 'Nombre *',
                validator: ValidatorHelper.required,
              ),
              TextFormFieldWidget(
                controller: state.form?.descriptionController,
                label: 'Descripcion',
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  OutlinedButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      context.goNamed(CategoryPage.name);
                    },
                  ),
                  FilledButton.icon(
                    label: const Text('Guardar'),
                    icon: const Icon(Icons.save_outlined),
                    onPressed: () {
                      if (state.form!.formController!.currentState!
                          .validate()) {
                        controller.save();
                        context.goNamed(CategoryPage.name);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
