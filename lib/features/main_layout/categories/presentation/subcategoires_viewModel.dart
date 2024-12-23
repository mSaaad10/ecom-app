import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:ecommerce_app/domain/usecases/get_subcategories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubcategoriesViewModel extends Cubit<SubcategoriesState> {
  @factoryMethod
  SubcategoriesViewModel({required this.subcategoriesUseCase})
      : super(SubcategoriesLoadingState());

  GetSubcategoriesUseCase subcategoriesUseCase;

  void loadSubcategories(String categoryId) async {
    emit(SubcategoriesLoadingState());
    var result = await subcategoriesUseCase.execute(categoryId);
    switch (result) {
      case Success<List<SubcategoryEntity>>():
        emit(SubcategoriesSuccessState(subcategories: result.data));
      case ServerError<List<SubcategoryEntity>>():
        emit(SubcategoriesErrorState(exception: result.serverErrorException));
      case Error<List<SubcategoryEntity>>():
        emit(SubcategoriesErrorState(exception: result.exception));
    }
  }
}

sealed class SubcategoriesState {}

class SubcategoriesSuccessState extends SubcategoriesState {
  List<SubcategoryEntity> subcategories;

  SubcategoriesSuccessState({required this.subcategories});
}

class SubcategoriesLoadingState extends SubcategoriesState {
  String? loadingMessage;

  SubcategoriesLoadingState({this.loadingMessage});
}

class SubcategoriesErrorState extends SubcategoriesState {
  Exception exception;

  SubcategoriesErrorState({required this.exception});
}
