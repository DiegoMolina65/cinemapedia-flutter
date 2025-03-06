import 'package:cinemapedia/domain/datasources/user_datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/infrastructure/mappers/user_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatasourceImpl implements UserDatasource {
  final FirebaseFirestore _firestore;

  UserDatasourceImpl(this._firestore);

  @override
  Future<Users> getUserData(String uid) async {
    try {
      final snapshot = await _firestore.collection('users').doc(uid).get();
      if (snapshot.exists) {
        final user = UserMapper.fromMap(snapshot.data()!);
        return user; 
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  @override
  Future<void> updateUserData(Users user) async {
    try {
      final userData = UserMapper.toMap(user);
      await _firestore.collection('users').doc(user.uid).update(userData);
    } catch (e) {
      throw Exception('Error updating user data: $e');
    }
  }
}
