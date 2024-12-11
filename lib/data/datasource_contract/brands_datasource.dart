import 'package:ecommerce_app/data/api/model/brands_response/Brand.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class BrandsDataSource {
  Future<Result<List<Brand>>> getBrands();
}
