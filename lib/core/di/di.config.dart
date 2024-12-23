// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api_manager/api_manager.dart' as _i671;
import '../../data/datasource_contract/brands_datasource.dart' as _i912;
import '../../data/datasource_contract/categories_datasource.dart' as _i546;
import '../../data/datasource_contract/products_datasource.dart' as _i550;
import '../../data/datasource_contract/subcategries_datasource.dart' as _i394;
import '../../data/datasource_impl/brands_datasource_impl.dart' as _i598;
import '../../data/datasource_impl/categories_datasource_impl.dart' as _i71;
import '../../data/datasource_impl/products_datasource_impl.dart' as _i876;
import '../../data/datasource_impl/subcategories_datasource_impl.dart' as _i996;
import '../../data/repo_impl/brands_repo_impl.dart' as _i178;
import '../../data/repo_impl/categories_repo_impl.dart' as _i807;
import '../../data/repo_impl/products_repo_impl.dart' as _i302;
import '../../data/repo_impl/subcategories_repo_impl.dart' as _i805;
import '../../domain/repo_contract/brands_repo.dart' as _i119;
import '../../domain/repo_contract/categories_repo.dart' as _i41;
import '../../domain/repo_contract/products_repo.dart' as _i462;
import '../../domain/repo_contract/subcategories_repo.dart' as _i238;
import '../../domain/usecases/get_brands_usecase.dart' as _i717;
import '../../domain/usecases/get_categories_usecase.dart' as _i943;
import '../../domain/usecases/get_products_usecase.dart' as _i626;
import '../../domain/usecases/get_subcategories_usecase.dart' as _i763;
import '../../features/main_layout/categories/presentation/subcategoires_viewModel.dart'
    as _i339;
import '../../features/main_layout/home/presentation/viewModel/brands_viewModel.dart'
    as _i976;
import '../../features/main_layout/home/presentation/viewModel/categories_viewModel.dart'
    as _i157;
import '../../features/products_screen/presentation/screens/products_viewModel.dart'
    as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i671.ApiManager>(() => _i671.ApiManager());
    gh.factory<_i394.SubcategoriesDataSource>(() =>
        _i996.SubcategoriesDataSourceImpl(apiManager: gh<_i671.ApiManager>()));
    gh.factory<_i546.CategoriesDataSource>(() =>
        _i71.CategoriesDataSourceImpl(apiManager: gh<_i671.ApiManager>()));
    gh.factory<_i550.ProductsDataSource>(
        () => _i876.ProductsDataSourceImpl(apiManager: gh<_i671.ApiManager>()));
    gh.factory<_i912.BrandsDataSource>(
        () => _i598.BrandsDataSourceImpl(apiManager: gh<_i671.ApiManager>()));
    gh.factory<_i119.BrandsRepo>(
        () => _i178.BrandsRepoImpl(dataSource: gh<_i912.BrandsDataSource>()));
    gh.factory<_i238.SubcategoriesRepo>(() => _i805.SubcategoriesRepoImpl(
        dataSource: gh<_i394.SubcategoriesDataSource>()));
    gh.factory<_i462.ProductsRepo>(() =>
        _i302.ProductsRepoImpl(dataSource: gh<_i550.ProductsDataSource>()));
    gh.factory<_i763.GetSubcategoriesUseCase>(() =>
        _i763.GetSubcategoriesUseCase(repo: gh<_i238.SubcategoriesRepo>()));
    gh.factory<_i41.CategoriesRepo>(() =>
        _i807.CategoriesRepoImpl(dataSource: gh<_i546.CategoriesDataSource>()));
    gh.factory<_i626.GetProductsUseCase>(
        () => _i626.GetProductsUseCase(repo: gh<_i462.ProductsRepo>()));
    gh.factory<_i717.GetBrandsUseCase>(
        () => _i717.GetBrandsUseCase(repo: gh<_i119.BrandsRepo>()));
    gh.factory<_i526.ProductsViewModel>(() => _i526.ProductsViewModel(
        productsUseCase: gh<_i626.GetProductsUseCase>()));
    gh.factory<_i976.BrandsViewModel>(() =>
        _i976.BrandsViewModel(brandsUseCase: gh<_i717.GetBrandsUseCase>()));
    gh.factory<_i339.SubcategoriesViewModel>(() => _i339.SubcategoriesViewModel(
        subcategoriesUseCase: gh<_i763.GetSubcategoriesUseCase>()));
    gh.factory<_i943.GetCategoriesUseCase>(
        () => _i943.GetCategoriesUseCase(repo: gh<_i41.CategoriesRepo>()));
    gh.factory<_i157.CategoriesViewModel>(() =>
        _i157.CategoriesViewModel(useCase: gh<_i943.GetCategoriesUseCase>()));
    return this;
  }
}
