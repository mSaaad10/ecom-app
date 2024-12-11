import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class CategoriesRepo {
  Future<Result<List<CategoryEntity>>> getCategories();
}
