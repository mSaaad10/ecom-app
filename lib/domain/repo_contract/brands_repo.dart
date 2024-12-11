import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/result.dart';

abstract class BrandsRepo {
  Future<Result<List<BrandEntity>>> getBrands();
}
