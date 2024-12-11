import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({super.key, required this.category});

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CachedNetworkImage(
        //   height: 100,
        //   width: 100,
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

        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            child: CachedNetworkImage(
              imageUrl: category.image ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          category.name ?? '',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
