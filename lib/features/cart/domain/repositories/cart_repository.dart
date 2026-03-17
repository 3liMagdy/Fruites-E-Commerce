import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<List<CartItemEntity>> getCartItems();
  Future<void> saveCartItems(List<CartItemEntity> items);
}