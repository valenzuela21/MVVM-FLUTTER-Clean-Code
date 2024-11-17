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

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
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
                            StreamBuilder(
                                stream: _viewModel.outputIsUserNameValid,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _userNameController,
                                    decoration: InputDecorations.inputTheme(
                                        hintText: AppStrings.text_email.tr(),
                                        prefixIcon: Icons.email,
                                        borderColor: ColorManager.gray,
                                        borderTop: true,
                                        errorText: (snapshot.data ?? true)
                                            ? null
                                            : AppStrings.usernameError.tr()),
                                  );
                                }),
                            StreamBuilder(
                                stream: _viewModel.outputIsPasswordValid,
                                builder: (context, snapshot) {
                                  return TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    controller: _passwordController,
                                    decoration: InputDecorations.inputTheme(
                                        hintText: AppStrings.text_password.tr(),
                                        prefixIcon: Icons.lock_clock_sharp,
                                        borderColor: ColorManager.gray,
                                        borderTop: false,
                                        errorText: (snapshot.data ?? true)
                                            ? null
                                            : AppStrings.passwordError.tr()),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s20),
                  ElevatedButton(
                      onPressed: (){
                        _viewModel.login();
                      },
                      child: Text(AppStrings.start_session).tr())
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
