import 'package:ecommerce_app/data/api/model/categories_response/Category.dart';
import 'package:ecommerce_app/data/datasource_contract/categories_datasource.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/categories_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo {
  CategoriesDataSource dataSource;

  @factoryMethod
  CategoriesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    var result = await dataSource.getCategories();
    switch (result) {
      case Success<List<Category>>():
        return Success(
            data: result.data
                .map(
                  (category) => category.toCategoryEntity(),
                )
                .toList());
      case ServerError<List<Category>>():
        return ServerError(serverErrorException: result.serverErrorException);
      case Error<List<Category>>():
        return Error(exception: result.exception);
    }
  }
}
