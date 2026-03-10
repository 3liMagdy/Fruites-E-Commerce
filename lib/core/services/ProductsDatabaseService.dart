




abstract class ProductsDatabaseService {
  
  Future<List<Map<String, dynamic>>> getProducts();

  Future<List<Map<String, dynamic>>> getBestSellingProducts();

}