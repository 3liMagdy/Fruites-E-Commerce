import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.product,
    super.quantity = 1,
  });

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      product: entity.product,
      quantity: entity.quantity,
    );
  }

  // To be used for Hive/local DB in the future
  // factory CartItemModel.fromJson(Map<String, dynamic> json) { ... }
  // Map<String, dynamic> toJson() { ... }
}