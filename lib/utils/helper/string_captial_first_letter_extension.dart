
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension StringExtensions on String {
  bool isValidMobileNumber() {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this);
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Only allow numbers to be entered
    if (newValue.text.isEmpty) return newValue.copyWith(text: '');
    final n = int.tryParse(newValue.text);
    if (n == null) {
      return oldValue;
    }
    return newValue;
  }
}

String formatPrice(double price) {
  final formatter = NumberFormat("##,##,##,##,##0");
  return formatter.format(price);
}


class CurrencyFormatter {
  static final _currencyFormat =  NumberFormat("##,##,##,##,##0");

  static String format(String value) {
    final doubleValue = double.tryParse(value);

    if (doubleValue != null) {
      final newString = _currencyFormat.format(doubleValue);
      return newString;
    }

    return value;
  }

  static List<TextInputFormatter> getTextInputFormatters() {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
      TextInputFormatter.withFunction((oldValue, newValue) {
        return TextEditingValue(
          text: format(newValue.text),
          selection:
              TextSelection.collapsed(offset: format(newValue.text).length),
        );
      }),
    ];
  }
}