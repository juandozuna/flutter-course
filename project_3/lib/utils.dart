import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Groups the elements in [values] by the value returned by [key].
///
/// Returns a map from keys computed by [key] to a list of all values for which
/// [key] returns that key. The values appear in the list in the same relative
/// order as in [values].
Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

/// Utility method to get providers faster
T getProvider<T>(BuildContext context, [bool listen = true]) {
  return Provider.of<T>(context, listen: listen);
}

// get weekday initial from int
String getWeekDayInitial(int weekday) {
  switch (weekday) {
    case 1:
      return 'M';
    case 2:
      return 'T';
    case 3:
      return 'W';
    case 4:
      return 'T';
    case 5:
      return 'F';
    case 6:
      return 'S';
    case 7:
      return 'S';
    default:
      return '';
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "en_US");

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

void showAppBottomSheet(BuildContext context, Widget child) {
  showBottomSheet(
      context: context,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: child,
            ),
          ),
        );
      });
}
