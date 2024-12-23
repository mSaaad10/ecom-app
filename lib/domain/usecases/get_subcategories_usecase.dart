import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/subcategories_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubcategoriesUseCase {
  SubcategoriesRepo repo;

  @factoryMethod
  GetSubcategoriesUseCase({required this.repo});

  Future<Result<List<SubcategoryEntity>>> execute(String categoryId) {
    return repo.getSubcategories(categoryId);
  }
}
