import 'dart:async';

import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/error_state_widget.dart';
import 'package:ecommerce_app/core/widget/loading_state_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/viewModel/brands_viewModel.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/viewModel/categories_viewModel.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/viewModel/most_selling_products_viewModel.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/widget/product_card.dart';
import '../widgets/custom_ads_widget.dart';
import '../widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

// 3
  final List<String> adsImages = [
    ImageAssets.carouselSlider1, // 0
    ImageAssets.carouselSlider2, // 1
    ImageAssets.carouselSlider3, // 2
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    categoriesViewModel.loadCategories();
    brandsViewModel.loadBrands();
    productsViewModel.loadMostSellingProducts();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        // 1
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); //to avoid memory leaks
    super.dispose();
  }

  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt<BrandsViewModel>();
  ProductsViewModel productsViewModel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => categoriesViewModel,
        ),
        BlocProvider(
          create: (context) => brandsViewModel,
        ),
        BlocProvider(
          create: (context) => productsViewModel,
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionName: 'Categories', onClick: () {}),
                BlocBuilder<CategoriesViewModel, CategoriesState>(
                  builder: (context, state) {
                    switch (state) {
                      case CategoriesSuccessState():
                        return SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                category: state.categories[index],
                              );
                            },
                            itemCount: state.categories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        );
                      case CategoriesLoadingState():
                        return LoadingStateWidget();
                      case CategoriesErrorState():
                        return ErrorStateWidget(
                          exception: state.exception,
                          retryButtonText: 'retry',
                          retryButtonAction: () {
                            categoriesViewModel.loadCategories();
                          },
                        );
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionName: 'Brands', onClick: () {}),
                BlocBuilder<BrandsViewModel, BrandsState>(
                  builder: (context, state) {
                    switch (state) {
                      case BrandsSuccessState():
                        return SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomBrandWidget(
                                brand: state.brands[index],
                              );
                            },
                            itemCount: state.brands.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        );
                      case BrandsLoadingState():
                        return LoadingStateWidget();
                      case BrandsErrorState():
                        return ErrorStateWidget(
                          exception: state.exception,
                          retryButtonText: 'retry',
                          retryButtonAction: () {
                            brandsViewModel.loadBrands();
                          },
                        );
                    }
                  },
                ),
                CustomSectionBar(
                  sectionName: 'Most Selling Products',
                  onClick: () {},
                ),
                BlocBuilder<ProductsViewModel, ProductsState>(
                  builder: (context, state) {
                    switch (state) {
                      case ProductsSuccessState():
                        return SizedBox(
                          height: 360.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                  title: state.products[index].title ?? '',
                                  description:
                                      state.products[index].description ?? '',
                                  //  "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                                  rating:
                                      state.products[index].ratingsAverage ?? 0,
                                  price: state.products[index].price ?? 0,
                                  priceBeforeDiscound:
                                      state.products[index].price ?? 0,
                                  image:
                                      state.products[index].imageCover ?? '');
                            },
                            itemCount: state.products.length,
                          ),
                        );
                      case ProductsLoadingState():
                        return LoadingStateWidget();
                      case ProductsErrorState():
                        return ErrorStateWidget(
                          exception: state.exception,
                          retryButtonText: 'retry',
                          retryButtonAction: () {
                            productsViewModel.loadMostSellingProducts();
                          },
                        );
                    }
                  },
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
