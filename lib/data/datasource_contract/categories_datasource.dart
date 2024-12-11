import 'package:ecommerce_app/data/api/model/categories_response/Category.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class CategoriesDataSource {
  Future<Result<List<Category>>> getCategories();
}
