import 'package:intl/intl.dart';

class NumberFormatHelper {
  static String toCurrency(double value) =>
      NumberFormat.currency().format(value);
}
