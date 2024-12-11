import 'package:ecommerce_app/data/api/model/brands_response/Brand.dart';
import 'package:ecommerce_app/data/datasource_contract/brands_datasource.dart';
import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/brands_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepo)
class BrandsRepoImpl extends BrandsRepo {
  BrandsDataSource dataSource;

  @factoryMethod
  BrandsRepoImpl({required this.dataSource});

  @override
  Future<Result<List<BrandEntity>>> getBrands() async {
    var result = await dataSource.getBrands();
    switch (result) {
      case Success<List<Brand>>():
        return Success(
            data: result.data
                .map(
                  (brand) => brand.toBrandEntity(),
                )
                .toList());
      case ServerError<List<Brand>>():
        return ServerError(serverErrorException: result.serverErrorException);
      case Error<List<Brand>>():
        return Error(exception: result.exception);
    }
  }
}
