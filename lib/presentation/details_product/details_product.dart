import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/routes_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';

class DetailsProductView extends StatefulWidget {
  const DetailsProductView({super.key});

  @override
  State<DetailsProductView> createState() => _DetailsProductViewState();
}

class _DetailsProductViewState extends State<DetailsProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grayLight,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(AppStrings.viewDetailProduct,
            style: getMediumStyle(
                color: ColorManager.white, fontSize: AppSize.s20)).tr(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.productsRoute);
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Text("Iphone X", style: getMediumStyle(color: ColorManager.primary, fontSize: AppSize.s28))

            ],
          )
        ],
      )),
    );
  }
}
