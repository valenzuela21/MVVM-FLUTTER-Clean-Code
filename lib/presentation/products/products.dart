import 'package:approducts/presentation/common/components/start_rating.dart';
import 'package:approducts/presentation/products/ProductsViewmodel.dart';
import 'package:approducts/presentation/resources/assets_manager.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/routes_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/DI.dart';
import '../common/state_render/state_render_impl.dart';
import '../resources/style_manager.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsState();
}

class _ProductsState extends State<ProductsView> {
  final ProductsViewModel _viewModel = instance<ProductsViewModel>();
  final TextEditingController _searchController = TextEditingController();

  _bind() {
    _viewModel.start();
    _viewModel.loadProducts();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: ColorManager.primary,
          title: Text(AppStrings.testStartInit,
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: AppSize.s20))
              .tr(),
        ),
        backgroundColor: ColorManager.grayLight,
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(), () {
                    _viewModel.start();
                  }) ??
                  _getContentWidget();
            }));
  }

  Widget _getContentWidget() {
    return SafeArea(
        child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: _viewModel.productsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error Snapshot: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No se encontraron productos.'));
              }

              final products = snapshot.data!;

              return Padding(
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
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSize.s0, vertical: AppSize.s8),
                      ),
                      style: TextStyle(
                        fontSize: AppSize.s20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: AppSize.s20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> product = products[index];
                          print(product);
                          return Container(
                              width: double.infinity,
                              child: Card(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: AppSize.s14,
                                          vertical: AppSize.s14),
                                      child: Column(
                                        children: [_HeaderCard(product: product), _ContentCard(product: product)],
                                      ))));
                        },
                      ),
                    ),

                  ],
                ),
              );
            }));
  }
}

class _ContentCard extends StatelessWidget {

  Map<String, dynamic> product;

  _ContentCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  ImageAssets.clip,
                  width: AppSize.s28,
                  height: AppSize.s28,
                ),
                SizedBox(width: 5),
                Text(
                  "${product['brand_name']} - \$899",
                  style: getMediumStyle(
                      color: ColorManager.primary, fontSize: AppSize.s14),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.blue,
                  foregroundColor: ColorManager.white,
                  minimumSize: Size(AppSize.s190, AppSize.s40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.detailProductRoute,
                    arguments: product["id"],
                  );
                },
                child: Text(AppStrings.viewDetails).tr(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  Map<String, dynamic> product;
  _HeaderCard({
    super.key, required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              child: Text(product['product_name'],
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: AppSize.s18)),
            )),
        Flexible(
          flex: 1,
          child: StartRatingComponent(startRating: product['rating'].toString(),),
        )
      ],
    );
  }
}
