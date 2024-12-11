import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';

class ProductEntity {
  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  //
  // ProductEntity.fromJson(dynamic json) {
  //   sold = json['sold'];
  //   images = json['images'] != null ? json['images'].cast<String>() : [];
  //   if (json['subcategory'] != null) {
  //     subcategory = [];
  //     json['subcategory'].forEach((v) {
  //       subcategory?.add(Subcategory.fromJson(v));
  //     });
  //   }
  //   ratingsQuantity = json['ratingsQuantity'];
  //   id = json['_id'];
  //   title = json['title'];
  //   slug = json['slug'];
  //   description = json['description'];
  //   quantity = json['quantity'];
  //   price = json['price'];
  //   imageCover = json['imageCover'];
  //   category = json['category'] != null ? Category.fromJson(json['category']) : null;
  //   brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  //   ratingsAverage = json['ratingsAverage'];
  //   id = json['id'];
  // }
  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryEntity? category;
  BrandEntity? brand;
  num? ratingsAverage;

//
// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['sold'] = sold;
//   map['images'] = images;
//   if (subcategory != null) {
//     map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
//   }
//   map['ratingsQuantity'] = ratingsQuantity;
//   map['_id'] = id;
//   map['title'] = title;
//   map['slug'] = slug;
//   map['description'] = description;
//   map['quantity'] = quantity;
//   map['price'] = price;
//   map['imageCover'] = imageCover;
//   if (category != null) {
//     map['category'] = category?.toJson();
//   }
//   if (brand != null) {
//     map['brand'] = brand?.toJson();
//   }
//   map['ratingsAverage'] = ratingsAverage;
//   map['id'] = id;
//   return map;
// }
}
