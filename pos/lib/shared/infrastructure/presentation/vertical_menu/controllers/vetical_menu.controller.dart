import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/shared/domain/models/vertical_menu/vertical_menu.model.dart';
import 'package:pos/shared/domain/repositories/vertical_menu.repository.dart';

part 'vertical_menu_event.dart';
part 'vetical_menu_state.dart';

class VerticalMenuController
    extends Bloc<VerticalMenuEvent, VerticalMenuState> {
  final VerticalMenuRepository repositoy;

  VerticalMenuController({
    required this.repositoy,
  }) : super(
          ManagementVerticalMenuState(),
        ) {
    on<GetAll>(_onGetAll);
    on<Navigate>(_onNavigate);
  }

  FutureOr<void> _onGetAll(
    GetAll event,
    Emitter<VerticalMenuState> emit,
  ) async {
    var menus = await repositoy.getAll();
    emit(
      ManagementVerticalMenuState(
        menus: menus,
        selectedIndex: 0,
      ),
    );
  }

  FutureOr<void> _onNavigate(
    Navigate event,
    Emitter<VerticalMenuState> emit,
  ) {
    emit(
      ManagementVerticalMenuState(
        menus: state.menus,
        selectedIndex: event.menu.index,
      ),
    );
  }

  void getAll() {
    add(
      GetAll(),
    );
  }

  void navigate(VerticalMenuModel menu) {
    add(
      Navigate(
        menu: menu,
      ),
    );
  }
}
