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
          child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Text("Iphone X",
                    style: getMediumStyle(
                        color: ColorManager.primary, fontSize: AppSize.s28)),
              ),
              Flexible(flex: 2, child: StartRatingComponent())
            ],
          ),
          Text("Descripción",
              style: getMediumStyle(
                  color: ColorManager.primary, fontSize: AppSize.s28)),
          Text(
              "Esta es una descripción del producto de apple que es muy lindo.",
              style: getRegularStyle(
                  color: ColorManager.primary, fontSize: AppSize.s18)),
          _ListPrices()
        ],
      )),
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
            Text("Marca: ", style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)),
            Image.asset(
              ImageAssets.clip,
              width: AppSize.s28,
              height: AppSize.s28,
            ),
            Text("Apple", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        Row(
          children: [
            Text("Precio: ", style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)),
            Text("\$ 899", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        Row(
          children: [
            Text("Categoria: ", style: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s20)),
            Text("SmartPhone", style: getRegularStyle(color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        )
      ],
    );
  }
}
