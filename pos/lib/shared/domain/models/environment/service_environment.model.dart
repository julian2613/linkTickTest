import 'package:pos/shared/domain/models/environment/route_environment.model.dart';

class ServiceEnvironment {
  final String protocol;
  final String host;
  final int port;
  final String path;
  final RouteEnvironment route;

  const ServiceEnvironment({
    required this.protocol,
    required this.host,
    required this.port,
    required this.path,
    required this.route,
  });
}
