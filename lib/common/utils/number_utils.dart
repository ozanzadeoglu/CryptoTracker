import 'dart:math';
import 'package:intl/intl.dart';

// A map to resolve currency codes to their common symbols.
// Only available currency's available on the map.
const Map<String, String> _currencySymbols = {
  'USD': '\$', // United States Dollar
  'TRY': '₺', // Turkish Lira
  'usd': '\$', // United States Dollar
  'try': '₺', // Turkish Lira
};

/// Formats a numeric [value] as a currency string with advanced rules.
///
/// - Uses the currency's symbol (e.g., '$') instead of its code ('USD').
/// - For prices >= 1.0, uses 2 decimal places.
/// - For prices < 1.0, it shows 3 significant digits after any leading zeros.
///   (e.g., 0.1234 -> $0.123, 0.001234 -> $0.00123)
///
/// - [value]: The number to format.
/// - [currencyCode]: The ISO 4217 currency code (e.g., 'USD').
/// - [locale]: The locale string for formatting (e.g., 'en_US', 'tr_TR').
String formatCurrency({required num value,required String currencyCode,required String locale}) {
  //  Resolve the currency symbol from map, falling back to the code.
  final String currencySymbol = _currencySymbols[currencyCode] ?? currencyCode;

  int decimalDigits;

  // Handle zero explicitly to avoid issues.
  if (value == 0) {
    decimalDigits = 2;
  }
  // For standard prices (1.0 or greater), use 2 decimal places.
  else if (value.abs() >= 1.0) {
    decimalDigits = 2;
  }
  // For small prices, calculate decimal places dynamically.
  else {
    final double log10Value = log(value.abs()) / ln10;
    final int leadingZeros = log10Value.floor().abs();
    decimalDigits = leadingZeros + 2;

    // Add a sane upper limit to prevent excessively long strings.
    const int maxDecimalDigits = 10;
    if (decimalDigits > maxDecimalDigits) {
      decimalDigits = maxDecimalDigits;
    }
  }

  final formatter = NumberFormat.currency(
    locale: locale,
    symbol: currencySymbol, 
    decimalDigits: decimalDigits,
  );

  return formatter.format(value);
}