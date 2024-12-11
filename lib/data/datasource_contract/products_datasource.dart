import 'package:ecommerce_app/data/api/model/products_response/Product.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class ProductsDataSource {
  Future<Result<List<Product>>> getProducts({String? sort});
}
