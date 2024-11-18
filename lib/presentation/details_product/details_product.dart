import 'package:approducts/presentation/common/components/no_found.dart';
import 'package:approducts/presentation/common/components/start_rating.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../app/DI.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/style_manager.dart';
import '../resources/values_manager.dart';
import 'DetailViewModel.dart';

class DetailsProductView extends StatefulWidget {
  final Object? id;

  DetailsProductView({super.key, required this.id});

  @override
  State<DetailsProductView> createState() => _DetailsProductViewState();
}

class _DetailsProductViewState extends State<DetailsProductView> {
  final DetailViewModel _viewModel = instance<DetailViewModel>();

  @override
  void initState() {
    final int productId = int.tryParse(widget.id.toString()) ?? 0;
    _viewModel.getProductById(productId);
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
        child: StreamBuilder<Map<String, dynamic>>(
            stream: _viewModel.productStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.twistingDots(
                    leftDotColor: ColorManager.purpleBlack,
                    rightDotColor: ColorManager.orangeLight,
                    size: AppSize.s65,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error Snapshot: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return NoFoundComponent();
              }

              final Map<String, dynamic> product = snapshot.data!;

              return Padding(
                  padding: EdgeInsets.all(AppSize.s18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(product['product_name'] ?? "",
                                  style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: AppSize.s40)),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: StartRatingComponent(
                                startRating:
                                    product['rating'].toString() ?? "0.0",
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(AppStrings.description,
                              style: getMediumStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s28))
                          .tr(),
                      Text(product['description'] ?? "",
                          style: getRegularStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s18)),
                      SizedBox(height: 20),
                      _ListPrices(product: product)
                    ],
                  ));
            }),
      ),
    );
  }
}

class _ListPrices extends StatelessWidget {
  final Map<String, dynamic> product;

  _ListPrices({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppStrings.text_branch,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s20))
                .tr(),
            Image.asset(
              ImageAssets.clip,
              width: AppSize.s28,
              height: AppSize.s28,
            ),
            Text(product['brand_name'] ?? "",
                style: getRegularStyle(
                    color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(AppStrings.text_price,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s20))
                .tr(),
            Text("\$ ${product['price'] ?? ""}",
                style: getRegularStyle(
                    color: ColorManager.primary, fontSize: AppSize.s18))
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(AppStrings.text_category,
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s20))
                .tr(),
            Text(product['category_name'] ?? "",
                    style: getRegularStyle(
                        color: ColorManager.primary, fontSize: AppSize.s18))
                .tr()
          ],
        )
      ],
    );
  }
}
