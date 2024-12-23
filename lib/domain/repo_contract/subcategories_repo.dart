import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class SubcategoriesRepo {
  Future<Result<List<SubcategoryEntity>>> getSubcategories(String categoryId);
}
