import 'package:flutter/material.dart';

MaterialStateProperty<T> propertySetter<T>(T value) =>
    MaterialStateProperty.all(value);
