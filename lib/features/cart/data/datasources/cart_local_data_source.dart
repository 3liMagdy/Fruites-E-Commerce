import 'package:fruits_hub/features/cart/data/models/cart_item_model.dart';
import 'package:fruits_hub/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> saveCartItems(List<CartItemEntity> items);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  // Simulating local storage for now (e.g., Hive or SharedPreferences)
  // In a real app, this would be a HiveBox or similar.
  final List<CartItemModel> _inMemoryStorage = [];

  @override
  Future<List<CartItemModel>> getCartItems() async {
    // Simulate reading from local DB
    return Future.value(List.from(_inMemoryStorage));
  }

  @override
  Future<void> saveCartItems(List<CartItemEntity> items) async {
    // Simulate writing to local DB
    _inMemoryStorage.clear();
    _inMemoryStorage.addAll(
      items.map((e) => CartItemModel.fromEntity(e)),
    );
    return Future.value();
  }
}