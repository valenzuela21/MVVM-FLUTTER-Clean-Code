import 'package:approducts/data/mapper/mapper.dart';
import 'package:approducts/presentation/common/components/confirm_modal/confirm_modal.dart';
import 'package:approducts/presentation/resources/assets_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:approducts/presentation/resources/style_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

enum StateRendererType {
  // POPUP STATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  POPUP_SUCCESS,

  // FULL SCREEN STATES
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE,
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONFIRM_DATABASE
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function? retryActionFunction;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading.tr(),
        title = title ?? EMPTY,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(context, [
          LoadingAnimationWidget.twistingDots(
            leftDotColor: ColorManager.purpleBlack,
            rightDotColor: ColorManager.orangeLight,
            size: AppSize.s65,
          ),
        ]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);
      case StateRendererType.POPUP_SUCCESS:
        return _getPopUpDialog(context, [
          _getMessage(title),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn([_getMessage(message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _getMessage(message),
          _getRetryButton(AppStrings.retry_again.tr(), context)
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn([_getMessage(message)]);
      case StateRendererType.CONFIRM_DATABASE:
        return _getPopUpDialog(context, [
         ConfirmModalComponent()
        ]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Text(
          message,
          style:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                    StateRendererType.FULL_SCREEN_ERROR_STATE) {
                  retryActionFunction
                      ?.call(); // to call the API function again to retry
                } else {
                  Navigator.of(context)
                      .pop(); // popup state error so we need to dismiss the dialog
                }
              },
              child: Text(buttonTitle)),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
