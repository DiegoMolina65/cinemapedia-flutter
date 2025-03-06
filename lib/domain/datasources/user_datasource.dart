import 'package:cinemapedia/domain/entities/entities.dart';

abstract class UserDatasource {
  Future<Users> getUserData(String uid);  
  Future<void> updateUserData(Users user);  
}
