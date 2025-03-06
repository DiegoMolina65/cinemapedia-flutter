import 'package:cinemapedia/domain/datasources/user_datasource.dart';
import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/domain/repositories/user_respository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<Users> getUserData(String uid) {
    return _userDatasource.getUserData(uid);  
  }

  @override
  Future<void> updateUserData(Users user) {
    return _userDatasource.updateUserData(user); 
  }
}
