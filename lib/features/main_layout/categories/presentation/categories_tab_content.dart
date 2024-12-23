import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/subcategoires_viewModel.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/sub_categories_list.dart';
import 'package:flutter/material.dart';

class CategoriesTabContent extends StatefulWidget {
  const CategoriesTabContent({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  State<CategoriesTabContent> createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTabContent> {
  var subcategoriesViewModel = getIt<SubcategoriesViewModel>();

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.categories[0];
  }

  late CategoryEntity selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoriesList(
          categories: widget.categories,
          onCategorySelected: onCategorySelected,
        ),
        SizedBox(
          width: AppSize.s16,
        ),
        SubCategoriesList(
          category: selectedCategory,
        ),
      ],
    );
  }

  void onCategorySelected(CategoryEntity category) {
    selectedCategory = category;
    setState(() {});
  }
}
