import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/error_state_widget.dart';
import 'package:ecommerce_app/core/widget/loading_state_widget.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab_content.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/viewModel/categories_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  var categoriesViewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesViewModel.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoriesViewModel,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: BlocBuilder<CategoriesViewModel, CategoriesState>(
          builder: (context, state) {
            switch (state) {
              case CategoriesSuccessState():
                return CategoriesTabContent(
                  categories: state.categories,
                );
              case CategoriesLoadingState():
                return LoadingStateWidget();
              case CategoriesErrorState():
                return ErrorStateWidget(
                  exception: state.exception,
                );
            }
          },
        ),
      ),
    );
  }
}
