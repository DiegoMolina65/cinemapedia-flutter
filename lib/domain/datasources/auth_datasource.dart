import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDatasource {
  Future<User?> signInWithEmailPassword(String email, String password);
  Future<User?> signUpWithEmailPassword(String email, String password, String name, String gender);
  Future<void> signOut();
  User? getCurrentUser();
  Future<void> saveUserData(String uid, String name, String email, String gender);
}
