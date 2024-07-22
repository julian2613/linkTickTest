import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos/shared/domain/models/vertical_menu/vertical_menu.model.dart';
import 'package:pos/shared/infrastructure/presentation/vertical_menu/controllers/vetical_menu.controller.dart';

class VerticalMenuPage extends StatelessWidget {
  const VerticalMenuPage({super.key});

  VerticalMenuModel? _getByIndex(List<VerticalMenuModel> menus, int index) {
    for (var menu in menus) {
      if (menu.index == index) {
        return menu;
      }
      if (menu.children != null) {
        return _getByIndex(menu.children!, index);
      }
    }
    return null;
  }

  Widget _getLabel(VerticalMenuModel menu) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(menu.label),
          const Divider(),
        ],
      ),
    );
  }

  Widget _getNavigation(VerticalMenuModel menu) {
    return NavigationDrawerDestination(
      label: Text(menu.label),
      icon: Icon(
        IconData(menu.icon!, fontFamily: 'MaterialIcons'),
      ),
    );
  }

  List<Widget> _getItems(List<VerticalMenuModel> menus) {
    List<Widget> widgets = [];
    for (VerticalMenuModel menu in menus) {
      if (menu.url == null) {
        widgets.add(
          _getLabel(menu),
        );
      } else {
        widgets.add(
          _getNavigation(menu),
        );
        widgets.add(
          const SizedBox(
            width: 5,
            height: 5,
          ),
        );
      }

      if (menu.children != null) {
        widgets.addAll(
          _getItems(menu.children!),
        );
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<VerticalMenuController>()..getAll();
    return BlocBuilder<VerticalMenuController, VerticalMenuState>(
      bloc: controller,
      builder: (context, state) {
        return NavigationDrawer(
          selectedIndex: state.selectedIndex,
          onDestinationSelected: (index) {
            VerticalMenuModel selectedMenu = _getByIndex(state.menus!, index)!;
            controller.navigate(
              selectedMenu,
            );
            context.goNamed(selectedMenu.url!);
          },
          children: [
            const IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/winkelsoft-35c62.appspot.com/o/user%2F7e1aa698-4fca-452b-9131-a6b6ec22625d%2Fprofile.jpg?alt=media&token=ebba8b64-c9e7-4860-a363-d702c59b6153',
                ),
              ),
              onPressed: null,
            ),
            if (state.menus != null) ..._getItems(state.menus!),
          ],
        );
      },
    );
  }
}
