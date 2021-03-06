import 'package:firebase_auth/firebase_auth.dart';
import 'package:section_8/domain/repositories/auth_repository.dart';

class AuthDataRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthDataRepository(this._firebaseAuth);

  @override
  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<bool> isSignedIn() async {
    final isLogged = (await getUser()) != null;
    return isLogged;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
