import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/app_init/app_init.dart';

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print('BACKGROUND MESSAGE');
  print('title: ${message.notification!.title}');
  print('body: ${message.notification!.body}');

  // if se cumplen las condiciones
  // Mandale al server marcando como recibido.
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = await initInjector();

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

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
