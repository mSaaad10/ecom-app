import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:ecommerce_app/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  @factoryMethod
  CategoriesViewModel({required this.useCase})
      : super(CategoriesLoadingState());
  GetCategoriesUseCase useCase;

  void loadCategories() async {
    emit(CategoriesLoadingState());
    var result = await useCase.execute();
    switch (result) {
      case Success<List<CategoryEntity>>():
        emit(CategoriesSuccessState(categories: result.data));
      case ServerError<List<CategoryEntity>>():
        emit(CategoriesErrorState(exception: result.serverErrorException));
      case Error<List<CategoryEntity>>():
        emit(CategoriesErrorState(exception: result.exception));
    }
  }
}

sealed class CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  List<CategoryEntity> categories;

  CategoriesSuccessState({required this.categories});
}

class CategoriesLoadingState extends CategoriesState {
  String? loadingMessage;

  CategoriesLoadingState({this.loadingMessage});
}

class CategoriesErrorState extends CategoriesState {
  Exception exception;

  CategoriesErrorState({required this.exception});
}
