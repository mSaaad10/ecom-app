import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:ecommerce_app/domain/usecases/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsState> {
  @factoryMethod
  ProductsViewModel({required this.productsUseCase})
      : super(ProductsLoadingState());

  GetProductsUseCase productsUseCase;

  void loadProducts(
      {String? brand,
      String? category,
      String? subcategory,
      String? sort}) async {
    emit(ProductsLoadingState());
    var result = await productsUseCase.execute(
        sort: sort, brand: brand, category: category, subcategory: subcategory);

    switch (result) {
      case Success<List<ProductEntity>>():
        emit(ProductsSuccessState(products: result.data));
      case ServerError<List<ProductEntity>>():
        emit(ProductsErrorState(exception: result.serverErrorException));
      case Error<List<ProductEntity>>():
        emit(ProductsErrorState(exception: result.exception));
    }
  }
}

sealed class ProductsState {}

class ProductsSuccessState extends ProductsState {
  List<ProductEntity> products;

  ProductsSuccessState({required this.products});
}

class ProductsLoadingState extends ProductsState {
  String? loadingMessage;

  ProductsLoadingState({this.loadingMessage});
}

class ProductsErrorState extends ProductsState {
  Exception exception;

  ProductsErrorState({required this.exception});
}
