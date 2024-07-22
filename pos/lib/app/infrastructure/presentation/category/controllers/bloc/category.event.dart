part of 'category.controller.dart';

@immutable
sealed class CategoryEvent {}

class CreateForm extends CategoryEvent {
  final CategoryModel? category;

  CreateForm({this.category});
}

class GetPageable extends CategoryEvent {
  final int page;
  final int size;

  GetPageable({
    required page,
    required size,
  })  : page = page ?? 0,
        size = size ?? 10;
}

class Save extends CategoryEvent {}

class Delete extends CategoryEvent {
  final String id;

  Delete({
    required this.id,
  });
}

class GetAllWarehouses extends CategoryEvent {}
