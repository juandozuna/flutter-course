/*
 * JUAN OZUNA Copyright (c) 2022.
 */

import 'package:flutter/material.dart';

class NoLocationPermissionPage extends StatelessWidget {
  const NoLocationPermissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No location permission'),
      ),
    );
  }
}
