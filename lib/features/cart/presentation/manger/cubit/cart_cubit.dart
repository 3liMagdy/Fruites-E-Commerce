

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/cart_item_model.dart';

part 'cart_state.dart';
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  /// ADD PRODUCT
  void addProduct(ProductEntity product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItemModel(product: product));
    }
    emit(CartUpdated(List.from(_items)));
  }

  /// REMOVE PRODUCT
  void removeProduct(ProductEntity product) {
    _items.removeWhere((item) => item.product.name == product.name);
    emit(CartUpdated(List.from(_items)));
  }

  /// INCREASE
  void increase(ProductEntity product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      _items[index].quantity++;
      emit(CartUpdated(List.from(_items)));
    }
  }

  /// DECREASE
  void decrease(ProductEntity product) {
    final index =
        _items.indexWhere((item) => item.product.name == product.name);

    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }

      emit(CartUpdated(List.from(_items)));
    }
  }

  /// CLEAR CART
  void clearCart() {
    _items.clear();
    emit(const CartUpdated([]));
  }
  void removeItem(int index) {
    _items.removeAt(index);
    emit(CartUpdated(List.from(_items)));
  }
  
  }