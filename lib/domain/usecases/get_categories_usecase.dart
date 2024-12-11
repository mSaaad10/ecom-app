import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/categories_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoriesRepo repo;

  @factoryMethod
  GetCategoriesUseCase({required this.repo});

  Future<Result<List<CategoryEntity>>> execute() {
    return repo.getCategories();
  }
}
