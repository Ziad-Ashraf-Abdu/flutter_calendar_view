import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppConstants {
  AppConstants._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(
      width: 2,
      color: AppColors.greenButton,
    ),
  );

  static InputDecoration get inputDecoration => InputDecoration(
        border: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.greenButton,
          ),
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        hintText: "Event Title",
        hintStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 17,
        ),
        labelStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 17,
        ),
        helperStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 17,
        ),
        errorStyle: TextStyle(
          color: AppColors.whiteText,
          fontSize: 12,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      );
}

class BreakPoints {
  static const double web = 800;
}
