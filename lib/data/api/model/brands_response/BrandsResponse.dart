import 'package:ecommerce_app/data/api/model/PaginationInfo.dart';

import 'Brand.dart';

class BrandsResponse {
  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  BrandsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationInfo.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Brand.fromJson(v));
      });
    }
  }

  num? results;
  PaginationInfo? metadata;
  List<Brand>? data;

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
