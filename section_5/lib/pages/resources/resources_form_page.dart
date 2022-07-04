import 'package:flutter/material.dart';
import 'package:section_5/pages/resources/widgets/resources_form.dart';

class ResourcesFormPage extends StatelessWidget {
  static const String routeName = '/resources/form';

  const ResourcesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources Form'),
      ),
      body: ResourcesForm(),
    );
  }
}
