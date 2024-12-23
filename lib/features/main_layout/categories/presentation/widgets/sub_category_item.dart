import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/domain/entities/SubcategoryEntity.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/productss_catalog.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final SubcategoryEntity subcategory;
  final String image;
  final Function navigation;

  const SubCategoryItem(
    this.image,
    this.navigation, {
    super.key,
    required this.subcategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productsScreenRoute,
          arguments: ProductsCatalog(subcategory: subcategory.id)),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(color: ColorManager.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            subcategory.name ?? '',
            style: getRegularStyle(color: ColorManager.primary),
          )
        ],
      ),
    );
  }
}
