import 'package:ecommerce_app/data/api/model/subcategories_response/Subcategory.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class SubcategoriesDataSource {
  Future<Result<List<Subcategory>>> getSubcategories(String categoryId);
}
