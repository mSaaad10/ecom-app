import 'package:ecommerce_app/data/api/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/api/model/subcategories_response/Subcategory.dart';
import 'package:ecommerce_app/data/datasource_contract/subcategries_datasource.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcategoriesDataSource)
class SubcategoriesDataSourceImpl extends SubcategoriesDataSource {
  ApiManager apiManager;

  @factoryMethod
  SubcategoriesDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Subcategory>>> getSubcategories(String categoryId) {
    return apiManager.getSubcategories(categoryId);
  }
}
