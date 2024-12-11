import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomSectionBar extends StatelessWidget {
  final String sectionName;
  final Function onClick;

  const CustomSectionBar(
      {super.key, required this.sectionName, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionName,
            style: getMediumStyle(
              fontSize: 18,
              color: ColorManager.darkBlue,
            ),
          ),
          TextButton(
            onPressed: () {
              onClick();
            },
            child: Text(
              'view all',
              style: getMediumStyle(color: ColorManager.darkBlue),
            ),
          ),
        ],
      ),
    );
  }
}
