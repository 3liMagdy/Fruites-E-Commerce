import 'dart:convert';

import 'package:fruits_hub/core/services/shared_prefs.dart';
import 'package:fruits_hub/core/utils/app_constant.dart';
import 'package:fruits_hub/features/Auth/data/user_model.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

UserEntity? getUserEntity() {

  final dataJson = SharedPrefs.getString(kUserData);

  if (dataJson == null || dataJson.isEmpty) {
    return null;
  }

  final decodedJson = jsonDecode(dataJson);

  return UserModel.fromJson(decodedJson);
}