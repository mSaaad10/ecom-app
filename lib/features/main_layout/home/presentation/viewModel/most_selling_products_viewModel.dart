import 'package:ecommerce_app/core/widget/loading_state_widget.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:ecommerce_app/domain/usecases/get_most_selling_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsState> {
  @factoryMethod
  ProductsViewModel({required this.mostSellingProductsUseCase})
      : super(ProductsLoadingState());
  GetMostSellingProductsUseCase mostSellingProductsUseCase;

  void loadMostSellingProducts() async {
    var result = await mostSellingProductsUseCase.execute();
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
