import 'package:approducts/app/di.dart';
import 'package:approducts/presentation/login/login.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String loginRoute = "/login";
  static const String productsRoute = "/productsRouter";
  static const String detailProductRoute = "/detailProduct";
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.productsRoute:
        return MaterialPageRoute(builder: (_) => Text("Hola"));
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

