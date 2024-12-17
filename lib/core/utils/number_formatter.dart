import 'package:intl/intl.dart';

class NumberFormatter {
  static final _currencyFormatter = NumberFormat.currency(
    symbol: 'RWF',
    decimalDigits: 0,
  );

  static final _compactFormatter = NumberFormat.compact();

  static String formatCurrency(double amount) {
    return _currencyFormatter.format(amount);
  }

  static String formatCompact(double number) {
    return _compactFormatter.format(number);
  }

  static String formatQuantity(double quantity, String unit) {
    return '${quantity.toStringAsFixed(2)} $unit';
  }
}