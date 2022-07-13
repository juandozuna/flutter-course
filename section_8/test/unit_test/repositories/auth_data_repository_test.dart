import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:section_8/data/repositories/auth_data_repository.dart';

import 'service_mocks.mocks.dart';

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late AuthDataRepository authDataRepository;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authDataRepository = AuthDataRepository(mockFirebaseAuth);
  });

  void stubCurrentUser([User? user]) {
    when(mockFirebaseAuth.currentUser).thenReturn(user);
  }

  test('should return false if has user', () async {
    stubCurrentUser(null);

    final result = await authDataRepository.isSignedIn();

    expect(result, false);
    verify(mockFirebaseAuth.currentUser);
    verifyNoMoreInteractions(mockFirebaseAuth);
  });

  test('should sign out user', () async {
    await authDataRepository.signOut();

    verify(mockFirebaseAuth.signOut());
    verifyNoMoreInteractions(mockFirebaseAuth);
  });

  test('shoud sign in user', () async {
    when(mockFirebaseAuth.signInWithEmailAndPassword(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer(
      (_) => Future.value(MockUserCredential()),
    );

    await authDataRepository.signInWithEmailAndPassword('email', 'password');

    verify(
      mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'email',
        password: 'password',
      ),
    );
    verifyNoMoreInteractions(mockFirebaseAuth);
  });
}
