part of 'vetical_menu.controller.dart';

@immutable
sealed class VerticalMenuState {
  List<VerticalMenuModel>? get menus => null;
  int? get selectedIndex => null;
}

final class ManagementVerticalMenuState extends VerticalMenuState {
  @override
  final List<VerticalMenuModel>? menus;

  @override
  final int? selectedIndex;

  ManagementVerticalMenuState({this.menus, this.selectedIndex});
}
