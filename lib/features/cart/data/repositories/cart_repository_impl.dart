
import 'package:fruits_hub/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl({required this.localDataSource});

  @override
  Future<List<CartItemEntity>> getCartItems() async {
    return await localDataSource.getCartItems();
  }

  @override
  Future<void> saveCartItems(List<CartItemEntity> items) async {
    await localDataSource.saveCartItems(items);
  }
}
