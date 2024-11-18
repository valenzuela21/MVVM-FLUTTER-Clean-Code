import 'package:approducts/app/di.dart';
import 'package:approducts/presentation/details_product/details_product.dart';
import 'package:approducts/presentation/login/login.dart';
import 'package:approducts/presentation/products/products.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:approducts/presentation/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String splash = "/";
  static const String loginRoute = "/login";
  static const String productsRoute = "/productsRouter";
  static const String detailProductRoute = "/detailProduct";
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.productsRoute:
        initProductsModule();
        return MaterialPageRoute(builder: (_) => ProductsView());
      case Routes.detailProductRoute:
        Object? id = routeSettings.arguments;
        return MaterialPageRoute(builder: (_) => DetailsProductView(id: id));
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            Scaffold(
              appBar: AppBar(title: const Text(AppStrings.noTitleFound).tr(),
              ),
              body: Center(child: const Text(AppStrings.noRouteFound).tr(),),
            ));
  }
}

