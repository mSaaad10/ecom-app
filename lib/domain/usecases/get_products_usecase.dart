import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/products_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  ProductsRepo repo;

  @factoryMethod
  GetProductsUseCase({required this.repo});

  Future<Result<List<ProductEntity>>> execute({
    String? sort,
    String? category,
    String? subcategory,
    String? brand,
  }) {
    return repo.getProducts(
        subcategory: subcategory, category: category, brand: brand, sort: sort);
  }
}
