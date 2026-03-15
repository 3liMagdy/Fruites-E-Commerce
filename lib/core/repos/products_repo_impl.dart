




import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/models/product_model.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';
import 'package:fruits_hub/core/services/ProductsDatabaseService.dart';

class ProductsRepoImpl extends ProductsRepo {

  final ProductsDatabaseService productsDatabaseService;

  ProductsRepoImpl(this.productsDatabaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {

      final data = await productsDatabaseService.getProducts();

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return right(products);

    } catch (e) {
      print(e);
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {

      final data = await productsDatabaseService.getBestSellingProducts();

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return right(products);

    } catch (e) {
        print(e);
      return left(ServerFailure('Failed to get best selling products'));
    }
  }
}