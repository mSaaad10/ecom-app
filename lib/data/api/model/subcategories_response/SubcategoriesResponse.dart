import 'package:ecommerce_app/data/api/model/PaginationInfo.dart';

import 'Subcategory.dart';

class SubcategoriesResponse {
  SubcategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  SubcategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? PaginationInfo.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Subcategory.fromJson(v));
      });
    }
  }

  num? results;
  PaginationInfo? metadata;
  List<Subcategory>? data;

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
