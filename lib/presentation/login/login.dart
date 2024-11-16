import 'package:approducts/app/di.dart';
import 'package:approducts/presentation/common/forms/input_decoration.dart';
import 'package:approducts/presentation/login/LoginViewModel.dart';
import 'package:approducts/presentation/resources/color_manager.dart';
import 'package:approducts/presentation/resources/strings_manager.dart';
import 'package:approducts/presentation/resources/style_manager.dart';
import 'package:approducts/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginState();
}

class _LoginState extends State<LoginView> {
  LoginViewModel _viewModel = instance<LoginViewModel>();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: StreamBuilder(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return _getContentWidget();
            }));
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: Align(
          alignment: Alignment.center,
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(AppStrings.start_session,
                                style: getMediumStyle(
                                    color: ColorManager.white, fontSize: 24))
                            .tr(),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: AppSize.s300,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _userNameController,
                              decoration: InputDecorations.inputTheme(
                                  hintText: AppStrings.text_email.tr(),
                                  prefixIcon: Icons.email,
                                  borderColor: ColorManager.gray,
                                  borderTop: true),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: _passwordController,
                              decoration: InputDecorations.inputTheme(
                                hintText: AppStrings.text_password.tr(),
                                prefixIcon: Icons.lock_clock_sharp,
                                borderColor: ColorManager.gray,
                                borderTop: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s20),
                  Padding(
                    padding: EdgeInsets.all(AppSize.s1_5),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppStrings.start_session).tr()),
                  )
                ],
              ))),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
