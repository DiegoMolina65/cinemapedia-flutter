import 'package:cinemapedia/domain/entities/entities.dart';

class UserMapper {
  // Mapeo de Map a entidad User
  static Users fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // Mapeo de entidad User a Map
  static Map<String, dynamic> toMap(Users user) {
    return {
      'name': user.name,
      'email': user.email,
      'gender': user.gender,
      'uid': user.uid,
    };
  }
}
