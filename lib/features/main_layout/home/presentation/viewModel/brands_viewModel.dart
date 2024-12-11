import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:ecommerce_app/domain/usecases/get_brands_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsViewModel extends Cubit<BrandsState> {
  @factoryMethod
  BrandsViewModel({required this.brandsUseCase}) : super(BrandsLoadingState());
  GetBrandsUseCase brandsUseCase;

  void loadBrands() async {
    var result = await brandsUseCase.execute();
    switch (result) {
      case Success<List<BrandEntity>>():
        emit(BrandsSuccessState(brands: result.data));
      case ServerError<List<BrandEntity>>():
        emit(BrandsErrorState(exception: result.serverErrorException));
      case Error<List<BrandEntity>>():
        emit(BrandsErrorState(exception: result.exception));
    }
  }
}

sealed class BrandsState {}

class BrandsSuccessState extends BrandsState {
  // list of brand entity
  List<BrandEntity> brands;

  BrandsSuccessState({required this.brands});
}

class BrandsLoadingState extends BrandsState {
  String? loadingMessage;

  BrandsLoadingState({this.loadingMessage});
}

class BrandsErrorState extends BrandsState {
  Exception exception;

  BrandsErrorState({required this.exception});
}
