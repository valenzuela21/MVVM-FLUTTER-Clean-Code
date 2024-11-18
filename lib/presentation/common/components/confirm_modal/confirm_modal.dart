import 'package:approducts/presentation/common/components/confirm_modal/ConfirmModalViewModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:approducts/presentation/resources/assets_manager.dart';

import '../../../../app/DI.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';

class ConfirmModalComponent extends StatelessWidget {
  final ConfirmModalViewModel _viewModel = instance<ConfirmModalViewModel>();

  ConfirmModalComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageAssets.notFoundData, width: AppSize.s190),
        Text(AppStrings.not_never_data,
            style: getMediumStyle(
                color: ColorManager.black, fontSize: AppSize.s20),
            textAlign: TextAlign.center)
            .tr(),
        Text(AppStrings.not_never_data,
            style: getMediumStyle(
                color: ColorManager.gray, fontSize: AppSize.s14),
            textAlign: TextAlign.center)
            .tr(),
        SizedBox(height: 10),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: ColorManager.blue,
            foregroundColor: ColorManager.white,
            minimumSize: Size(AppSize.s190, AppSize.s40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          ),
          onPressed: () {
            _viewModel.initTransferDatabaseLocal();
          },
          child: Text(AppStrings.yuo_want_update).tr(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
