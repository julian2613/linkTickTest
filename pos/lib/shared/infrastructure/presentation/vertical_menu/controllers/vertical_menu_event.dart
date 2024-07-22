part of 'vetical_menu.controller.dart';

@immutable
sealed class VerticalMenuEvent {}

class GetAll extends VerticalMenuEvent {}

class Navigate extends VerticalMenuEvent {
  final VerticalMenuModel menu;

  Navigate({
    required this.menu,
  });
}
