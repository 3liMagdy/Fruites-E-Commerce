

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/features/Auth/data/user_model.dart';
import 'package:fruits_hub/features/Auth/domain/entities/user_entity.dart';

class FirestoreService implements  DataService {
  @override
   FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId}) async {
      
      if(documentId !=null){
        await firestore.collection(path).doc(documentId).set(data);
      }else{
     await firestore.collection(path).add(data);
      }
      
      
  }

  @override
  Future<Map<String,dynamic>>  getData({required String path, required String document_id})async {
     
   var data=  await firestore.collection(path).doc(document_id).get();
   return data.data() as Map<String,dynamic>;

  }
  
  @override
  Future<bool> checkIfDataExists({required String path, required String document_id}) async{
      
   var data = await firestore.collection(path).doc(document_id).get();
   return data.exists;

  }

}

