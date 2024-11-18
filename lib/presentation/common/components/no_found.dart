import 'package:approducts/presentation/resources/assets_manager.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:approducts/presentation/resources/style_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoFoundComponent extends StatelessWidget {
  const NoFoundComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.notSearchData, width: AppSize.s250),
        Text(AppStrings.not_found_search, style: getMediumStyle(color: ColorManager.gray, fontSize: AppSize.s18)).tr()
      ],
    );
  }
}
