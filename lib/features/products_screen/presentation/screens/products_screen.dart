import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/error_state_widget.dart';
import 'package:ecommerce_app/core/widget/loading_state_widget.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/productss_catalog.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_viewModel.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.productsCatalog});

  final ProductsCatalog productsCatalog;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    print('Hellllo');
    super.initState();
    print('subcategoryId: ${widget.productsCatalog.subcategory}');
    print('BrandId: ${widget.productsCatalog.brand}');
    print('caegoryId: ${widget.productsCatalog.category}');
    print('sortBy: ${widget.productsCatalog.sort}');
    productsViewModel.loadProducts(
        brand: widget.productsCatalog.brand,
        category: widget.productsCatalog.category,
        subcategory: widget.productsCatalog.subcategory,
        sort: widget.productsCatalog.sort);
  }

  var productsViewModel = getIt<ProductsViewModel>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider.value(
      value: productsViewModel,
      child: Scaffold(
        appBar: const HomeScreenAppBar(
          automaticallyImplyLeading: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ProductsViewModel, ProductsState>(
                  builder: (context, state) {
                    switch (state) {
                      case ProductsSuccessState():
                        return GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return CustomProductWidget(
                              product: state.products[index],
                              height: height,
                              width: width,
                            );
                          },
                          scrollDirection: Axis.vertical,
                        );
                      case ProductsLoadingState():
                        return LoadingStateWidget();
                      case ProductsErrorState():
                        return ErrorStateWidget(
                          exception: state.exception,
                        );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
