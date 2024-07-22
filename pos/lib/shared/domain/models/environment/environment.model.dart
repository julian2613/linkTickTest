import 'package:pos/shared/domain/models/environment/route_environment.model.dart';
import 'package:pos/shared/domain/models/environment/service_environment.model.dart';

class AppEnvironment {
  static const String environment = String.fromEnvironment('environment');
  static ServiceEnvironment service = const ServiceEnvironment(
    protocol: String.fromEnvironment('service.protocol'),
    host: String.fromEnvironment('service.host'),
    port: int.fromEnvironment('service.port'),
    path: String.fromEnvironment('service.path'),
    route: RouteEnvironment(
      product: String.fromEnvironment('service.route.product'),
      category: String.fromEnvironment('service.route.category'),
      warehouse: String.fromEnvironment('service.route.warehouse'),
      adjustment: String.fromEnvironment('service.route.adjustment'),
      inventory: String.fromEnvironment('service.route.inventory'),
    ),
  );
}
