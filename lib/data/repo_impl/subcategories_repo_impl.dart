import 'package:ecommerce_app/data/api/model/subcategories_response/Subcategory.dart';
import 'package:ecommerce_app/data/datasource_contract/subcategries_datasource.dart';
import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/subcategories_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcategoriesRepo)
class SubcategoriesRepoImpl extends SubcategoriesRepo {
  SubcategoriesDataSource dataSource;

  SubcategoriesRepoImpl({required this.dataSource});

  @override
  Future<Result<List<SubcategoryEntity>>> getSubcategories(
      String categoryId) async {
    var result = await dataSource.getSubcategories(categoryId);
    switch (result) {
      case Success<List<Subcategory>>():
        return Success(
            data: result.data
                .map(
                  (subcategory) => subcategory.toSubCategoryEntity(),
                )
                .toList());
      case ServerError<List<Subcategory>>():
        return ServerError(serverErrorException: result.serverErrorException);
      case Error<List<Subcategory>>():
        return Error(exception: result.exception);
    }
  }
}
