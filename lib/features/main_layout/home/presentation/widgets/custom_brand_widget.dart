import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/domain/entities/BrandEntity.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/productss_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  const CustomBrandWidget({super.key, required this.brand});

  final BrandEntity brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productsScreenRoute,
            arguments: ProductsCatalog(brand: brand.id));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: CachedNetworkImage(
                  imageUrl: brand.image ?? '',
                )),
          ),
        ],
      ),
    );
  }
}


// CachedNetworkImage(
//   height: 80,
//   width: 80,
//   fit: BoxFit.cover,
//   imageUrl: ImageAssets.categoryHomeImage,
//   placeholder: (context, url) =>
//       const Center(child: CircularProgressIndicator()),
//   errorWidget: (context, url, error) =>
//       const Center(child: Icon(Icons.error)),
//   imageBuilder: (context, imageProvider) {
//     return Container(
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//           image: imageProvider,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   },
// ),