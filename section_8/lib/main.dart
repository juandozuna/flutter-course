import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/app_init/app_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await initInjector();

  runApp(Main(providers: providers));
}

class Main extends StatelessWidget {
  final List<SingleChildWidget> providers;

  const Main({
    Key? key,
    required this.providers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MultiProvider(
        providers: providers,
        child: const AppInit(),
      ),
    );
  }
}
