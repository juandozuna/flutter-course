import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  NavigatorState,
], customMocks: [
  MockSpec<GlobalKey<NavigatorState>>(
    as: #MockGlobalKey,
  ),
])
void main() {}
