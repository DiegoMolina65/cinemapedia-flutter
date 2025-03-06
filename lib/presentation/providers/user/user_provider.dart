import 'package:cinemapedia/domain/datasources/user_datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/domain/repositories/user_respository.dart';
import 'package:cinemapedia/infrastructure/repositories/user_repository_impl.dart';
import 'package:cinemapedia/infrastructure/datasources/user_datasource_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para el UserDatasource
final userDatasourceProvider = Provider<UserDatasource>((ref) {
  return UserDatasourceImpl(FirebaseFirestore.instance);
});

// FutureProvider para obtener los datos del usuario
final userProvider = FutureProvider.family<Users, String>((ref, uid) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getUserData(uid);  
});

// Provider para el UserRepository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userDatasource = ref.watch(userDatasourceProvider);
  return UserRepositoryImpl(userDatasource);
});
