import 'package:flutter/material.dart';
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
///

T getProvider<T>(BuildContext context, [bool listen = true]) {
  return Provider.of<T>(context, listen: listen);
}
