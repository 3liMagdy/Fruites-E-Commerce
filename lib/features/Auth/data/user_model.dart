import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'],
    email: json['email'],
    name: json['name'],
  );
}

    tomap() => {'id': id, 'email': email, 'name': name};

    factory UserModel.UserEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
       email: userEntity.email,
        name:userEntity.name,
        );
  }
}
