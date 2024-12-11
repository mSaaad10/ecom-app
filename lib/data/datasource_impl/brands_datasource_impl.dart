import 'package:ecommerce_app/data/api/api_manager/api_manager.dart';
import 'package:ecommerce_app/data/api/model/brands_response/Brand.dart';
import 'package:ecommerce_app/data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsDataSource)
class BrandsDataSourceImpl extends BrandsDataSource {
  ApiManager apiManager;

  @factoryMethod
  BrandsDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Brand>>> getBrands() {
    return apiManager.getBrands();
  }
}
