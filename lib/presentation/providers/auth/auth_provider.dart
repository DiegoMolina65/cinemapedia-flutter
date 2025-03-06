import 'package:cinemapedia/domain/datasources/auth_datasource.dart';
import 'package:cinemapedia/domain/repositories/auth_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/auth_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/auth_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';


// Provider para el AuthDatasource
final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  return AuthDatasourceImpl(FirebaseAuth.instance);
});

// Provider para el AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = ref.watch(authDatasourceProvider); 
  return AuthRepositoryImpl(authDatasource); 
});
