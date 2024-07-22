import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app/domain/models/warehouse/warehouse.model.dart';
import 'package:pos/app/domain/repositories/warehouse.repository.dart';
import 'package:pos/app/infrastructure/models/warehouse/warehouse_form.model.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';

part 'warehouse.event.dart';
part 'warehouse.state.dart';

class WarehouseController extends Bloc<WarehouseEvent, WarehouseState> {
  final WarehouseRepository repositoy;

  WarehouseController({
    required this.repositoy,
  }) : super(
          ManagementWarehouseState(),
        ) {
    on<CreateForm>(_onCreateForm);
    on<GetPageable>(_onGetPageable);
    on<Save>(_onPost);
    on<Delete>(_onDelete);
  }

  FutureOr<void> _onCreateForm(
    CreateForm event,
    Emitter<WarehouseState> emit,
  ) {
    emit(
      state.copyWith(
        form: WarehouseForm(
          formController: GlobalKey<FormState>(),
          id: event.warehouse?.id,
          nameController: TextEditingController(
            text: event.warehouse?.name,
          ),
          addressController: TextEditingController(
            text: event.warehouse?.address,
          ),
        ),
      ),
    );
  }

  FutureOr<void> _onGetPageable(
    GetPageable event,
    Emitter<WarehouseState> emit,
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
    Emitter<WarehouseState> emit,
  ) {
    if (state.form?.id == null) {
      repositoy.post(
        model: WarehouseModel(
          name: state.form!.nameController!.text,
          address: state.form?.addressController?.text != ''
              ? state.form?.addressController?.text
              : null,
        ),
      );
    } else {
      repositoy.put(
        model: WarehouseModel(
          id: state.form?.id,
          name: state.form!.nameController!.text,
          address: state.form?.addressController?.text != ''
              ? state.form?.addressController?.text
              : null,
        ),
      );
    }
  }

  FutureOr<void> _onDelete(
    Delete event,
    Emitter<WarehouseState> emit,
  ) async {
    await repositoy.delete(id: event.id);
    getPageable();
  }

  void createForm({WarehouseModel? warehouse}) {
    add(
      CreateForm(warehouse: warehouse),
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
}
