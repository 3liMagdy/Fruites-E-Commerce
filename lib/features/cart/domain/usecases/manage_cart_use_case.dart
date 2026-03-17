import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/cart/domain/repositories/cart_repository.dart';

class ManageCartUseCase {
  final CartRepository repository;

  ManageCartUseCase(this.repository);

  Future<CartEntity> getCart() async {
    final items = await repository.getCartItems();
    return CartEntity(items: items);
  }

  Future<CartEntity> addProduct(CartEntity cart, ProductEntity product) async {
    final updatedItems = List<CartItemEntity>.from(cart.items);
    final index = _findItemIndex(updatedItems, product);
     
    if (index != -1) {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity + 1,
      );
    } else {
      updatedItems.add(CartItemEntity(product: product));
    }

    await repository.saveCartItems(updatedItems);
    return CartEntity(items: updatedItems);
  }

  Future<CartEntity> removeProduct(CartEntity cart, ProductEntity product) async {
    final updatedItems = List<CartItemEntity>.from(cart.items);
    updatedItems.removeWhere((item) => item.product.code == product.code);
    
    await repository.saveCartItems(updatedItems);
    return CartEntity(items: updatedItems);
  }

  Future<CartEntity> increaseQuantity(CartEntity cart, ProductEntity product) async {
    final updatedItems = List<CartItemEntity>.from(cart.items);
    final index = _findItemIndex(updatedItems, product);

    if (index != -1) {
      updatedItems[index] = updatedItems[index].copyWith(
        quantity: updatedItems[index].quantity + 1,
      );
      await repository.saveCartItems(updatedItems);
    }
    
    return CartEntity(items: updatedItems);
  }

  Future<CartEntity> decreaseQuantity(CartEntity cart, ProductEntity product) async {
    final updatedItems = List<CartItemEntity>.from(cart.items);
    final index = _findItemIndex(updatedItems, product);

    if (index != -1) {
      if (updatedItems[index].quantity > 1) {
        updatedItems[index] = updatedItems[index].copyWith(
          quantity: updatedItems[index].quantity - 1,
        );
      } else {
        updatedItems.removeAt(index);
      }
      await repository.saveCartItems(updatedItems);
    }

    return CartEntity(items: updatedItems);
  }

  Future<CartEntity> clearCart() async {
    await repository.saveCartItems([]);
    return const CartEntity(items: []);
  }

int _findItemIndex(List<CartItemEntity> items, ProductEntity product) {
  return items.indexWhere((item) => item.product.id == product.id);
}
}