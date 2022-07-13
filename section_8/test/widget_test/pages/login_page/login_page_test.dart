import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:section_8/presentation/login/login_page.dart';
import 'package:section_8/presentation/login/widgets/login_form.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/widgets/logo.dart';

import '../../../unit_test/providers/repository_moks.mocks.dart';

void main() {
  late Widget testWidget;
  late Widget childWidget;
  late AuthProvider authProvider;
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    authProvider = AuthProvider(authRepository);
    childWidget = LoginPage();
    testWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: MaterialApp(
        home: childWidget,
      ),
    );
  });

  testWidgets(
    'Login Page should render correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(testWidget);

      await tester.pumpAndSettle();

      final scaffoldFinder = find.byType(Scaffold);
      expect(scaffoldFinder, findsOneWidget);

      final columnFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Column &&
            widget.mainAxisAlignment == MainAxisAlignment.center &&
            widget.children.length == 3,
      );
      expect(columnFinder, findsOneWidget);

      expect(find.byType(Logo), findsOneWidget);
      expect(find.byType(LoginForm), findsOneWidget);

      final sizedBoxFinder = find.byWidgetPredicate(
        (widget) => widget is SizedBox && widget.height == 10,
      );
      expect(sizedBoxFinder, findsOneWidget);
    },
  );
}
