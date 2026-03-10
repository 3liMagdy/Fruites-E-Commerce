



import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductEntity> products;

  const ProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductsFailure extends ProductsState {
  final String message;

  const ProductsFailure(this.message);

  @override
  List<Object?> get props => [message];
}