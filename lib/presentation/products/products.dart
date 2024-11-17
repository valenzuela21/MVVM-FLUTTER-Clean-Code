import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/style_manager.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsState();
}

class _ProductsState extends State<ProductsView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: ColorManager.primary,
          title: Text(AppStrings.testStartInit, style: getMediumStyle(
              color: ColorManager.white, fontSize: AppSize.s20)).tr(),
        ),
        backgroundColor: ColorManager.grayLight,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(AppSize.s8),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: AppStrings.searchHint.tr(),
                  labelText: AppStrings.searchLabel.tr(),
                  hintStyle: TextStyle(
                    fontSize: AppSize.s20,
                    color: ColorManager.black,
                  ),
                  labelStyle: TextStyle(
                    fontSize: AppSize.s18,
                    color: ColorManager.black,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: AppSize.s0, vertical: AppSize.s8),
                ),
                style: TextStyle(
                  fontSize: AppSize.s20, // Tamaño de la fuente cuando el usuario escribe
                  color: Colors.black, // Color del texto escrito
                ),
              )
            ],
          ),
        )));
  }
}
