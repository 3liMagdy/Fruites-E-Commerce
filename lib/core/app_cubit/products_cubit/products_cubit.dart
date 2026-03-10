

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/app_cubit/products_cubit/products_state.dart';
import 'package:fruits_hub/core/repos/products_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());

    final result = await productsRepo.getProducts();

    result.fold(
      (failure) => emit(ProductsFailure(failure.errMessage)),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());

    final result = await productsRepo.getBestSellingProducts();

    result.fold(
      (failure) => emit(ProductsFailure(failure.errMessage)),
      (products) => emit(ProductsLoaded(products)),
    );
  }
}