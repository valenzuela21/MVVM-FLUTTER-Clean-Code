import 'dart:async';

import 'package:approducts/app/DI.dart';
import 'package:approducts/app/app_prefs.dart';
import 'package:approducts/presentation/resources/assets_manager.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/routes_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay(){
    _timer = Timer(Duration(seconds: 2),_goNext);
  }

  _goNext() async {
    _appPreferences.getIsUserLoogedIn().then((isUserLogin) => {
          if (isUserLogin)
            {Navigator.pushReplacementNamed(context, Routes.productsRoute)}
          else
            {Navigator.pushReplacementNamed(context, Routes.loginRoute)}
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Container(
          width: AppSize.s140,
          height: AppSize.s140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s14),
            image: DecorationImage(
              image: AssetImage(ImageAssets.plashLogo),
              fit: BoxFit.cover,
            ),
          ),
        )
      )
    );
  }
}
