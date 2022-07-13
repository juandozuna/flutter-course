import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:section_8/presentation/constants/routes.dart';
import 'package:section_8/presentation/providers/init_provider.dart';

import 'navigator_util.mocks.dart';
import 'repository_moks.mocks.dart';

void main() {
  late InitProvider initProvider;
  late MockAuthRepository authRepository;
  late MockDeviceRepository deviceRepository;
  late MockGlobalKey globalKey;
  late MockNavigatorState navigatorState;

  setUp(() {
    authRepository = MockAuthRepository();
    deviceRepository = MockDeviceRepository();
    globalKey = MockGlobalKey();
    navigatorState = MockNavigatorState();

    initProvider = InitProvider(
      authRepository,
      deviceRepository,
      globalKey,
    );
  });

  group('Init', () {
    void stubGlobalKey() {
      when(globalKey.currentState).thenReturn(navigatorState);
    }

    void stubHandleLocationPermission(bool result) =>
        when(deviceRepository.getLocationPermissions()).thenAnswer(
          (_) => Future.value(result),
        );

    void stubNavigation() {
      when(navigatorState.pushNamed(any)).thenAnswer((_) => Future.value());
      when(navigatorState.pushReplacementNamed(any))
          .thenAnswer((_) => Future.value());
    }

    void stubSignIn(bool result) {
      when(authRepository.isSignedIn())
          .thenAnswer((realInvocation) => Future.value(result));
    }

    test(
        'Should navigate to no location permission page and then goes to login',
        () async {
      stubGlobalKey();
      stubNavigation();
      stubHandleLocationPermission(false);
      stubSignIn(false);

      await initProvider.init();

      verify(deviceRepository.getLocationPermissions());
      verify(navigatorState.pushNamed(AppRoute.errorNoLocationPermission));
      verify(authRepository.isSignedIn());
      verify(navigatorState.pushReplacementNamed(AppRoute.login));
      verifyNoMoreInteractions(authRepository);
      verifyNoMoreInteractions(navigatorState);
      verifyNoMoreInteractions(deviceRepository);
    });

    test('Should navigate to no location permission page and then goes to home',
        () async {
      stubGlobalKey();
      stubNavigation();
      stubHandleLocationPermission(false);
      stubSignIn(true);

      await initProvider.init();

      verify(deviceRepository.getLocationPermissions());
      verify(navigatorState.pushNamed(AppRoute.errorNoLocationPermission));
      verify(authRepository.isSignedIn());
      verify(navigatorState.pushReplacementNamed(AppRoute.home));
      verifyNoMoreInteractions(authRepository);
      verifyNoMoreInteractions(navigatorState);
      verifyNoMoreInteractions(deviceRepository);
    });

    test('Should navigate to home', () async {
      stubGlobalKey();
      stubNavigation();
      stubHandleLocationPermission(true);
      stubSignIn(true);

      await initProvider.init();

      verify(deviceRepository.getLocationPermissions());
      verify(authRepository.isSignedIn());
      verify(navigatorState.pushReplacementNamed(AppRoute.home));
      verifyNoMoreInteractions(authRepository);
      verifyNoMoreInteractions(navigatorState);
      verifyNoMoreInteractions(deviceRepository);
    });
  });
}
