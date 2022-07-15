import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:section_8/presentation/login/widgets/login_form.dart';
import 'package:section_8/presentation/providers/auth_provider.dart';
import 'package:section_8/presentation/widgets/app_text_field.dart';
import 'package:section_8/presentation/widgets/error_container.dart';
import 'package:section_8/presentation/widgets/primary_button.dart';

import '../../../unit_test/providers/repository_moks.mocks.dart';

void main() {
  late Widget testWidget;
  late Widget childWidget;
  late AuthProvider authProvider;
  late MockAuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepository();
    authProvider = AuthProvider(authRepository);
    childWidget = LoginForm();
    testWidget = MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: MaterialApp(
        home: Material(child: childWidget),
      ),
    );
  });

  testWidgets('should render login form correctly', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(ErrorContainer), findsNothing);
    expect(find.byType(AppTextField), findsNWidgets(2));
    expect(find.byType(PrimaryButton), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) => widget is SizedBox && widget.height == 20,
      ),
      findsOneWidget,
    );
  });

  group('form validations', () {
    testWidgets('should return all properties required', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final emailRequiredFinder = find.text('Email is required');
      final passwordRequiredFinder = find.text('Password is required');

      expect(emailRequiredFinder, findsNothing);
      expect(passwordRequiredFinder, findsNothing);

      final submitButtonFinder = find.text('Log In');
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();

      expect(emailRequiredFinder, findsOneWidget);
      expect(passwordRequiredFinder, findsOneWidget);
    });

    testWidgets('should return invalid email error', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final emailRequiredFinder = find.text('Email is invalid');

      expect(emailRequiredFinder, findsNothing);

      await tester.enterText(find.byKey(Key('email-field')), 'text');

      final submitButtonFinder = find.text('Log In');
      await tester.tap(submitButtonFinder);

      await tester.pumpAndSettle();

      expect(emailRequiredFinder, findsOneWidget);
    });

    testWidgets('should submit form and return exception', (tester) async {
      when(authRepository.signInWithEmailAndPassword(any, any)).thenThrow(
        Exception('An Exception'),
      );
      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final errorContainerFinder = find.byType(ErrorContainer);

      expect(errorContainerFinder, findsNothing);

      await tester.enterText(find.byKey(Key('email-field')), 'test@test.com');
      await tester.pump();

      await tester.enterText(find.byKey(Key('password-field')), '123456');
      await tester.pumpAndSettle();

      final submitButtonFinder = find.text('Log In');
      await tester.tap(submitButtonFinder);
      await tester.pumpAndSettle();

      verify(authRepository.signInWithEmailAndPassword(
        'test@test.com',
        '123456',
      ));
      expect(errorContainerFinder, findsOneWidget);
    });
  });
}
