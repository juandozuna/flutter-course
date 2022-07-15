import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:section_8/presentation/home/home_page.dart';

import '../lib/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test on login', () {
    testWidgets('should perform login wrongfully', (tester) async {
      await app.main();
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 2));

      await tester.enterText(find.byKey(Key('email-field')), 'test@test.com');
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(find.byKey(Key('password-field')), '123456');
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.text('Log In'));
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 2));

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
