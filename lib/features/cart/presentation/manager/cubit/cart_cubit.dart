import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_hub/features/cart/domain/usecases/manage_cart_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final ManageCartUseCase manageCartUseCase;

  CartCubit({required this.manageCartUseCase}) : super(CartInitial());

  CartEntity _currentCart = const CartEntity(items: []);

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      _currentCart = await manageCartUseCase.getCart();
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addProduct(ProductEntity product) async {
    try {
      _currentCart = await manageCartUseCase.addProduct(_currentCart, product);
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> removeProduct(ProductEntity product) async {
    try {
      _currentCart = await manageCartUseCase.removeProduct(_currentCart, product);
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> increase(ProductEntity product) async {
    try {
      _currentCart = await manageCartUseCase.increaseQuantity(_currentCart, product);
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> decrease(ProductEntity product) async {
    try {
      _currentCart = await manageCartUseCase.decreaseQuantity(_currentCart, product);
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> clearCart() async {
    try {
      _currentCart = await manageCartUseCase.clearCart();
      _emitCartState();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void _emitCartState() {
    if (_currentCart.items.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartUpdated(_currentCart));
    }
  }
}