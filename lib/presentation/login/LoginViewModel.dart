import 'dart:async';

import 'package:approducts/domain/usecase/login_usecase.dart';
import 'package:approducts/presentation/base/baseviewmodel.dart';
import 'package:approducts/presentation/common/freezed_data_classes.dart';
import 'package:approducts/presentation/common/state_render/state_render.dart';
import 'package:approducts/presentation/common/state_render/state_render_impl.dart';

class LoginViewModel extends BaseViewModel implements LoginViewModelInputs, LoginViewModelOutputs {

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  StreamController _isAllInputsValidStreamController = StreamController<void>.broadcast();
  StreamController isUserLoggedInSuccessFullyStreamController = StreamController<String>();

  var loginObject = LoginObject("", "");

  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);


  @override
  Sink get inputIsAllInputValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  login() {
    inputState.add(LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
  }

  @override
  Stream<bool> get outputIsAllInputsValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }

}

abstract class LoginViewModelInputs {
    setUserName(String userName);
    setPassword(String password);
    login();
    Sink get inputUserName;
    Sink get inputPassword;
    Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}