import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/values_manager.dart';
class StartRatingComponent extends StatelessWidget {
  const StartRatingComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        // Color de fondo del contenedor
        borderRadius:
        BorderRadius.circular(AppSize
            .s8),
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.start,
            width: AppSize.s20,
            height: AppSize.s20,
          ),
          SizedBox(width: 10),
          Text(
            "4.43",
            style: getRegularStyle(
                color: ColorManager.white,
                fontSize: AppSize.s18),
          )
        ],
      ),
    );
  }
}
