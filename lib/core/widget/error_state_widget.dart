import 'dart:io';

import 'package:ecommerce_app/domain/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorStateWidget extends StatelessWidget {
  Exception? exception;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(
      {super.key,
      this.exception,
      this.retryButtonText,
      this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(extractError()),
          SizedBox(
            height: 8.h,
          ),
          if (retryButtonText != null)
            ElevatedButton(
                onPressed: () {
                  retryButtonAction?.call();
                },
                child: Text(retryButtonText!))
        ],
      ),
    );
  }

  String extractError() {
    String message = 'Something went wrong';
    switch (exception) {
      case ServerErrorException():
        message = (exception as ServerErrorException).message;
      case SocketException():
        message = 'No Internet connection';
      case HttpException():
        message = "Couldn't find the post";
      case FormatException():
        message = 'Bad response format ';
    }
    return message;

    // if (serverError?.message != null) {
    //   message = serverError!.message;
    //   return message;
    // }
    // if (error?.exception != null) {
    //   var ex = error!.exception;
    //   switch (ex) {
    //     case SocketException():
    //       message = 'No Internet connection';
    //     case HttpException():
    //       message = "Couldn't find the post";
    //     case FormatException():
    //       message = 'Bad response format ';
    //   }
    //   return message;
    // }
    // return message;
  }
}

//const -> compile time
// final -> run time
