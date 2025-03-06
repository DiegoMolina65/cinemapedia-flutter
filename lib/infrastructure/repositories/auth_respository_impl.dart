import 'package:cinemapedia/domain/datasources/auth_datasource.dart';
import 'package:cinemapedia/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl(this._authDatasource);

  @override
  User? getCurrentUser() {
    return _authDatasource.getCurrentUser();
  }

  @override
  Future<User?> signInWithEmailPassword(String email, String password) {
    return _authDatasource.signInWithEmailPassword(email, password);
  }

  @override
  Future<void> signOut() {
    return _authDatasource.signOut();
  }

  @override
  Future<User?> signUpWithEmailPassword(String email, String password, String name, String gender) {
    return _authDatasource.signUpWithEmailPassword(email, password, name, gender);
  }
}
