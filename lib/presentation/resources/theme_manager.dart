import 'package:approducts/presentation/resources/style_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.white,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.blue),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p2),
      hintStyle: getRegularStyle(color: ColorManager.gray),
      labelStyle: getMediumStyle(color: ColorManager.gray),
      errorStyle: getRegularStyle(color: ColorManager.error),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(AppSize.s300, AppSize.s40),
        foregroundColor: ColorManager.white,
        backgroundColor: ColorManager.blue,
        padding: EdgeInsets.symmetric(vertical: AppSize.s8, horizontal: AppSize.s18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        elevation: AppSize.s8, // Sombra
      ),
    ),
  );
}
