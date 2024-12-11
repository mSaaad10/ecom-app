import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/products_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostSellingProductsUseCase {
  ProductsRepo repo;

  @factoryMethod
  GetMostSellingProductsUseCase({required this.repo});

  Future<Result<List<ProductEntity>>> execute() {
    return repo.getProducts(sort: '-sold');
  }
}
