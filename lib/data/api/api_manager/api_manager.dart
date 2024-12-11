import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/extensions/http_extension.dart';
import 'package:ecommerce_app/data/api/end_points/end_points.dart';
import 'package:ecommerce_app/data/api/model/ErrorResponse.dart';
import 'package:ecommerce_app/data/api/model/brands_response/Brand.dart';
import 'package:ecommerce_app/data/api/model/brands_response/BrandsResponse.dart';
import 'package:ecommerce_app/data/api/model/categories_response/CategoriesResponse.dart';
import 'package:ecommerce_app/data/api/model/categories_response/Category.dart';
import 'package:ecommerce_app/data/api/model/products_response/Product.dart';
import 'package:ecommerce_app/data/api/model/products_response/ProductsResponse.dart';
import 'package:ecommerce_app/domain/result.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  }

  Future<Result<List<Category>>> getCategories() async {
    try {
      var response = await dio.get(
        EndPoints.categoriesEndPoint,
      );

      if (response.statusCode?.isSuccessRequest == true) {
        CategoriesResponse categoriesResponse =
            CategoriesResponse.fromJson(response.data);
        return Success(data: categoriesResponse.data ?? []);
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? '',
                message: errorResponse.message ?? ''));
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

  Future<Result<List<Brand>>> getBrands() async {
    try {
      var response = await dio.get(EndPoints.brandsEndPoint);
      if (response.statusCode?.isSuccessRequest == true) {
        var brandsResponse = BrandsResponse.fromJson(response.data);
        return Success(data: brandsResponse.data ?? []);
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? '',
                message: errorResponse.message ?? ''));
      }
    } on Exception catch (ex) {
      return Error(exception: ex);
    }
  }

  Future<Result<List<Product>>> getProducts({String? sort}) async {
    try {
      var response =
          await dio.get(EndPoints.productsEndPoint, queryParameters: {
        'sort': sort,
      });
      if (response.statusCode?.isSuccessRequest == true) {
        var productsResponse = ProductsResponse.fromJson(response.data);
        return Success(data: productsResponse.data ?? []);
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response.data);
        return ServerError(
            serverErrorException: ServerErrorException(
                statusMsg: errorResponse.statusMsg ?? '',
                message: errorResponse.message ?? ''));
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}
