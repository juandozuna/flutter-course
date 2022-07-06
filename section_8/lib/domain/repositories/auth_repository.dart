import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<User?> getUser();
}
