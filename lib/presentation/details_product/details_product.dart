import 'package:approducts/presentation/resources/color_manager.dart';
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
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Text("Detalle del Producto",
            style: getMediumStyle(
                color: ColorManager.white, fontSize: AppSize.s20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.white),
          // Icono de flecha para volver
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.productsRoute);
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [Text("Working")],
      )),
    );
  }
}
