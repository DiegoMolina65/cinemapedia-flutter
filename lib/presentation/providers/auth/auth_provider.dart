import 'package:cinemapedia/domain/datasources/auth_datasource.dart';
import 'package:cinemapedia/domain/repositories/auth_repository.dart';
import 'package:cinemapedia/infrastructure/datasources/auth_datasource_impl.dart';
import 'package:cinemapedia/infrastructure/repositories/auth_respository_impl.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  final firestore = FirebaseFirestore.instance;  
  return AuthDatasourceImpl(FirebaseAuth.instance, firestore);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDatasource = ref.watch(authDatasourceProvider);
  return AuthRepositoryImpl(authDatasource);
});
