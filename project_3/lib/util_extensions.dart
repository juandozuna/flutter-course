import 'package:intl/intl.dart';

extension DoubleExtension on double {
  // Return string formatted as currency
  String toCurrency() {
    final currencyFormatter = NumberFormat('#,##0.00', 'en_US');
    final formatted = currencyFormatter.format(this);
    return '\$$formatted';
  }
}

extension DateExtension on DateTime {
  //format date as string
  String formatDate() {
    final dateFormatter = DateFormat('MMM d, yyyy');
    return dateFormatter.format(this);
  }
}
