import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/controllers/warehouse.controller.dart';
import 'package:pos/app/infrastructure/presentation/warehouse/pages/warehouse.page.dart';
import 'package:pos/shared/infrastructure/presentation/helper/utils/validator.helper.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/field/text_form_field.widget.dart';
import 'package:pos/shared/infrastructure/presentation/helper/widgets/text/text.widget.dart';

class CreateWarehousePage extends StatelessWidget {
  static const String name = 'warehouse/create';

  const CreateWarehousePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<WarehouseController>();
    return BlocBuilder<WarehouseController, WarehouseState>(
      bloc: controller,
      builder: (context, state) {
        return Form(
          key: state.form?.formController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextWidget(
                label:
                    state.form?.id == null ? 'Nuevo almacen' : 'Editar almacen',
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              TextFormFieldWidget(
                controller: state.form?.nameController,
                label: 'Nombre *',
                validator: ValidatorHelper.required,
              ),
              TextFormFieldWidget(
                controller: state.form?.addressController,
                label: 'Direccion',
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
                      context.goNamed(WarehousePage.name);
                    },
                  ),
                  FilledButton.icon(
                    label: const Text('Guardar'),
                    icon: const Icon(Icons.save_outlined),
                    onPressed: () {
                      if (state.form!.formController!.currentState!
                          .validate()) {
                        controller.save();
                        context.goNamed(WarehousePage.name);
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
