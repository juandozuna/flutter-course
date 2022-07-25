import 'package:flutter/material.dart';
import 'package:section_5/app_config.dart';
import 'package:section_5/injector.dart';
import 'package:section_5/models/resource_model.dart';
import 'package:section_5/pages/resources/widgets/resources_form.dart';

class ResourceFormPageArgs {
  final Resource resource;

  ResourceFormPageArgs({
    required this.resource,
  });
}

class ResourcesFormPage extends StatelessWidget {
  static const String routeName = '/resources/form';

  const ResourcesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ResourceFormPageArgs?;

    final config = get<AppConfig>();

    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
      ),
      body: ResourcesForm(
        resource: args?.resource,
      ),
    );
  }
}
