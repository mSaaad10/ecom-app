import 'package:ecommerce_app/domain/entities/ProductEntity.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class ProductsRepo {
  Future<Result<List<ProductEntity>>> getProducts({String? sort});
}
