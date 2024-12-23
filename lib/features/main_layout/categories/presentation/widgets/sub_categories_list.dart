import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/error_state_widget.dart';
import 'package:ecommerce_app/core/widget/loading_state_widget.dart';
import 'package:ecommerce_app/domain/entities/CategoryEntity.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/subcategoires_viewModel.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({super.key, required this.category});

  final CategoryEntity category;

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  var subcategoriesViewModel = getIt<SubcategoriesViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.category.id);
    subcategoriesViewModel.loadSubcategories(widget.category.id ?? '');
  }

  @override
  void didUpdateWidget(covariant SubCategoriesList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category.id != widget.category.id) {
      subcategoriesViewModel.loadSubcategories(widget.category.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => subcategoriesViewModel,
      child: Expanded(
        flex: 2,
        child: CustomScrollView(
          slivers: <Widget>[
            // category title
            SliverToBoxAdapter(
              child: Text(
                'Laptops & Electronics',
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s14),
              ),
            ),
            // the category card
            SliverToBoxAdapter(
              child: CategoryCardItem(
                  "Laptops & Electronics",
                  ImageAssets.categoryCardImage,
                  goToCategoryProductsListScreen),
            ),
            // the grid view of the subcategories
            BlocBuilder<SubcategoriesViewModel, SubcategoriesState>(
              builder: (context, state) {
                switch (state) {
                  case SubcategoriesSuccessState():
                    {
                      var subcategories = state.subcategories;
                      return SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            childCount: subcategories.length,
                            (context, index) => SubCategoryItem(
                                subcategory: state.subcategories[index],
                                ImageAssets.subcategoryCardImage,
                                goToCategoryProductsListScreen),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: AppSize.s8,
                            crossAxisSpacing: AppSize.s8,
                          ));
                    }

                  case SubcategoriesLoadingState():
                    return SliverToBoxAdapter(child: LoadingStateWidget());
                  case SubcategoriesErrorState():
                    return SliverToBoxAdapter(
                        child: ErrorStateWidget(
                      exception: state.exception,
                    ));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
