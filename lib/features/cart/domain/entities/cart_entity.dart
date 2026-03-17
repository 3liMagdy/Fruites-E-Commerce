import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> items;

  const CartEntity({
    required this.items,
  });

  num get totalPrice =>
      items.fold(0, (sum, item) => sum + item.totalPrice);

  @override
  List<Object?> get props => [items];
}