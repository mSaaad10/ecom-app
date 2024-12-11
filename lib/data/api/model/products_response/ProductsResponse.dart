import 'package:ecommerce_app/data/api/model/PaginationInfo.dart';

import 'Product.dart';

class ProductsResponse {
  ProductsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationInfo.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Product.fromJson(v));
      });
    }
  }

  num? results;
  PaginationInfo? metadata;
  List<Product>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
