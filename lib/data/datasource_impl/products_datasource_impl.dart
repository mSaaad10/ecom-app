import 'package:ecommerce_app/data/api/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/api/model/products_response/Product.dart';
import 'package:ecommerce_app/data/datasource_contract/products_datasource.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl extends ProductsDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductsDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Product>>> getProducts({String? sort}) {
    return apiManager.getProducts(sort: sort);
  }
}
