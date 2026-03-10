

import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

abstract class DataService {
  


   Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
}