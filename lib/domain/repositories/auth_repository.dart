import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmailPassword(String email, String password);
  Future<User?> signUpWithEmailPassword(String email, String password);
  Future<void> signOut();
  User? getCurrentUser();
}
