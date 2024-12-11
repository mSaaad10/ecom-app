import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/repo_contract/brands_repo.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  BrandsRepo repo;

  @factoryMethod
  GetBrandsUseCase({required this.repo});

  Future<Result<List<BrandEntity>>> execute() {
    return repo.getBrands();
  }
}
