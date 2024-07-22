import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app/domain/models/category/category.model.dart';
import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/app/domain/repositories/category.repository.dart';
import 'package:pos/app/domain/repositories/warehouse.repository.dart';
import 'package:pos/app/infrastructure/models/category/category_form.model.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';

part 'category.event.dart';
part 'category.state.dart';

class CategoryController extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repositoy;
  final WarehouseRepository warehouseRepositoy;

  CategoryController({
    required this.repositoy,
    required this.warehouseRepositoy,
  }) : super(
          ManagementCategoryState(),
        ) {
    on<CreateForm>(_onCreateForm);
    on<GetPageable>(_onGetPageable);
    on<Save>(_onPost);
    on<Delete>(_onDelete);
    on<GetAllWarehouses>(_onGetAllWarehouses);
  }

  FutureOr<void> _onCreateForm(
    CreateForm event,
    Emitter<CategoryState> emit,
  ) async {
    emit(
      state.copyWith(
        form: CategoryForm(
          formController: GlobalKey<FormState>(),
          id: event.category?.id,
          warehouseController: TextEditingController(
            text: event.category?.warehouse.id,
          ),
          imageController: TextEditingController(
            text: event.category?.image,
          ),
          nameController: TextEditingController(
            text: event.category?.name,
          ),
          descriptionController: TextEditingController(
            text: event.category?.description,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onGetPageable(
    GetPageable event,
    Emitter<CategoryState> emit,
  ) async {
    var pageable = await repositoy.getPageable(
      page: event.page,
      size: event.size,
    );
    emit(
      state.copyWith(
        pageable: pageable,
      ),
    );
  }

  FutureOr<void> _onPost(
    Save event,
    Emitter<CategoryState> emit,
  ) {
    if (state.form?.id == null) {
      repositoy.post(
        model: CategoryModel(
          warehouse: WarehouseModel(
            id: state.form?.warehouseController!.text,
          ),
          name: state.form!.nameController!.text,
          description: state.form?.descriptionController?.text != ''
              ? state.form?.descriptionController?.text
              : null,
          image: state.form?.imageController?.text != ''
              ? state.form?.imageController?.text
              : null,
        ),
      );
    } else {
      repositoy.put(
        model: CategoryModel(
          id: state.form?.id,
          warehouse: WarehouseModel(
            id: state.form?.warehouseController!.text,
          ),
          name: state.form!.nameController!.text,
          description: state.form?.descriptionController?.text != ''
              ? state.form?.descriptionController?.text
              : null,
          image: state.form?.imageController?.text != ''
              ? state.form?.imageController?.text
              : null,
        ),
      );
    }
  }

  FutureOr<void> _onDelete(
    Delete event,
    Emitter<CategoryState> emit,
  ) async {
    await repositoy.delete(id: event.id);
    getPageable();
  }

  FutureOr<void> _onGetAllWarehouses(
    GetAllWarehouses event,
    Emitter<CategoryState> emit,
  ) async {
    var warehouses = await warehouseRepositoy.getAll();
    emit(
      state.copyWith(
        warehouses: warehouses,
      ),
    );
  }

  void createForm({CategoryModel? category}) {
    add(
      CreateForm(category: category),
    );
  }

  void getPageable({
    int? page,
    int? size,
  }) {
    add(
      GetPageable(
        page: page,
        size: size,
      ),
    );
  }

  void save() {
    add(
      Save(),
    );
  }

  void delete(String id) {
    add(
      Delete(
        id: id,
      ),
    );
  }

  void getAllWarehouses() {
    add(
      GetAllWarehouses(),
    );
  }
}
