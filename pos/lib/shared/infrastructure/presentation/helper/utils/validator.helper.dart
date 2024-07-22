class ValidatorHelper {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Requerido';
    }
    return null;
  }
}
