import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingStateWidget extends StatelessWidget {
  String? loadingMessage;

  LoadingStateWidget({super.key, this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loadingMessage != null) Text(loadingMessage!),
        SizedBox(
          width: 4.w,
        ),
        Center(
          child: CircularProgressIndicator(color: ColorManager.darkBlue),
        ),
      ],
    );
  }
}
