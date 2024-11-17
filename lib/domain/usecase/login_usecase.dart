import 'package:approducts/data/network/Failure.dart';
import 'package:approducts/data/request/request.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:approducts/domain/repository/repository.dart';
import 'package:approducts/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication>{
  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.username, input.password));
  }

}

class LoginUseCaseInput {
  String username;
  String password;
  LoginUseCaseInput(this.username, this.password);
}