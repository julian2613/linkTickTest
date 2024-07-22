import 'package:dio/dio.dart';
import 'package:pos/shared/domain/models/generic/generic.model.dart';
import 'package:pos/shared/domain/models/pageable/pageable.model.dart';
import 'package:pos/shared/domain/repositories/crud.repository.dart';

abstract class CrudHttpRepository<MODEL extends Generic>
    implements CrudRepository<MODEL> {
  abstract String path;
  abstract MODEL Function(Map<String, dynamic> json) mapper;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080/',
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    ),
  );

  @override
  Future<MODEL> post({required MODEL model}) async {
    final response = await dio.post(
      path,
      data: model,
    );
    return mapper(response.data);
  }

  @override
  Future<MODEL> put({required MODEL model}) async {
    final response = await dio.put(
      '$path/${model.get("id")}',
      data: model,
    );
    return mapper(response.data);
  }

  @override
  Future<List<MODEL>> getAll() async {
    final response = await dio.get(path);
    return (response.data as List<dynamic>)
        .map((json) => mapper(json))
        .toList();
  }

  @override
  Future<Pageable<MODEL>> getPageable({
    required int page,
    required int size,
  }) async {
    final response = await dio.get(
      path,
      queryParameters: {
        'page': page,
        'size': size,
      },
    );
    return Pageable.fromJson(
      response.data,
      (json) => mapper(json as Map<String, dynamic>),
    );
  }

  @override
  Future<void> delete({required String id}) async {
    await dio.delete('$path/$id');
  }
}
