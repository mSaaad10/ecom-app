import 'package:ecommerce_app/data/api/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/api/model/categories_response/Category.dart';
import 'package:ecommerce_app/data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  CategoriesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Category>>> getCategories() async {
    var result = await apiManager.getCategories();
    switch (result) {
      case Success<List<Category>>():
        return Success(data: result.data);
      case ServerError<List<Category>>():
        return ServerError(serverErrorException: result.serverErrorException);
      case Error<List<Category>>():
        return Error(exception: result.exception);
    }
  }
}
