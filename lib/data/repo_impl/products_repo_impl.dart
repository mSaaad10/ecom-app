import 'package:ecommerce_app/data/api/model/products_response/Product.dart';
import 'package:ecommerce_app/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/products_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  ProductsDataSource dataSource;

  @factoryMethod
  ProductsRepoImpl({required this.dataSource});

  @override
  Future<Result<List<ProductEntity>>> getProducts({
    String? sort,
    String? category,
    String? subcategory,
    String? brand,
  }) async {
    var result = await dataSource.getProducts(
        sort: sort, brand: brand, category: category, subcategory: subcategory);
    switch (result) {
      case Success<List<Product>>():
        return Success(
            data: result.data
                .map(
                  (product) => product.toProductEntity(),
                )
                .toList());
      case ServerError<List<Product>>():
        return ServerError(serverErrorException: result.serverErrorException);
      case Error<List<Product>>():
        return Error(exception: result.exception);
    }
  }
}
