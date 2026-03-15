import 'package:fruits_hub/core/services/ProductsDatabaseService.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService implements DataService {
  final SupabaseClient client;

  SupabaseDatabaseService(this.client);

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      data['id'] = documentId;
    }
    await client.from(path).upsert(data);
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? docuementId,
    Map<String, dynamic>? query,
  }) async {
    if (docuementId != null) {
      final response = await client.from(path).select().eq('id', docuementId).single();
      return response;
    }
    
    var request = client.from(path).select();
    if (query != null) {
      query.forEach((key, value) {
        request = request.eq(key, value);
      });
    }
    final response = await request;
    return response;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    final response = await client.from(path).select().eq('id', docuementId);
    return response.isNotEmpty;
  }
}

class SupabaseProductsDatabaseService implements ProductsDatabaseService {
  final SupabaseClient client;

  SupabaseProductsDatabaseService(this.client);

  @override
  Future<List<Map<String, dynamic>>> getProducts() async {
    final response = await client.from('products').select();

    return List<Map<String, dynamic>>.from(response);
  }

  @override
  Future<List<Map<String, dynamic>>> getBestSellingProducts() async {
    final response = await client
        .from('products')
        .select()
        .order('sellingCount', ascending: false)
        .limit(4);

    return List<Map<String, dynamic>>.from(response);
  }
}
