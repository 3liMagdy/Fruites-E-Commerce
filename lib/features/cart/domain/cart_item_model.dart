import 'package:fruits_hub/core/entities/product_entity.dart';

class CartItemModel {
  final ProductEntity product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  num get totalPrice => product.price * quantity;
}