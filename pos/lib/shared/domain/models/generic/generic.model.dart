abstract class Generic {
  const Generic();

  Map<String, dynamic> toJson();

  dynamic get(String propertyName) {
    var map = toJson();
    if (map.containsKey(propertyName)) {
      return map[propertyName];
    }
    throw ArgumentError('Propery not found');
  }
}
