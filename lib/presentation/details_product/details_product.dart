import 'package:approducts/presentation/common/components/start_rating.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';

class DetailsProductView extends StatefulWidget {

  final Object? id;

  DetailsProductView({super.key, required this.id});

  @override
  State<DetailsProductView> createState() => _DetailsProductViewState();
}

class _DetailsProductViewState extends State<DetailsProductView> {

  @override
  void initState() {
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grayLight,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text(AppStrings.viewDetailProduct,
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: AppSize.s20))
            .tr(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.productsRoute);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(AppSize.s18), child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text("",
                          style: getBoldStyle(
                              color: ColorManager.primary, fontSize: AppSize.s40)),
                    ),
                  ),
                  Flexible(flex: 1, child: StartRatingComponent(startRating: "0.9",))
                ],
              ),
              SizedBox(height: 20),
              Text(AppStrings.description,
                  style: getMediumStyle(
                      color: ColorManager.primary, fontSize: AppSize.s28)).tr(),
              Text(
                  "Esta es una descripción del producto de apple que es muy lindo.",
                  style: getRegularStyle(
                      color: ColorManager.primary, fontSize: AppSize.s18)),
              SizedBox(height: 20),
              _ListPrices()
            ],
          ))),
    );
  }
}

class _ListPrices extends StatelessWidget {
  const _ListPrices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.text_branch, style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)).tr(),
            Image.asset(
              ImageAssets.clip,
              width: AppSize.s28,
              height: AppSize.s28,
            ),
            Text("Apple", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(AppStrings.text_price, style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)).tr(),
            Text("\$ 899", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(AppStrings.text_category, style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)),
            Text("SmartPhone", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18)).tr()
          ],
        )
      ],
    );
  }
}
