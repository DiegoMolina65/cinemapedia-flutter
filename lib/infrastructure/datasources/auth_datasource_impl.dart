import 'package:cinemapedia/domain/datasources/auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final FirebaseAuth _firebaseAuth;

  AuthDatasourceImpl(this._firebaseAuth);

  @override
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}
