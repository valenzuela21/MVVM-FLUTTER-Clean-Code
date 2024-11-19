import 'package:approducts/data/network/failure.dart';
import 'package:approducts/data/responses/branches.response.dart';
import 'package:dartz/dartz.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class BranchesUseCase implements BaseUseCase<void, List<dynamic>>{
  Repository _repository;
  BranchesUseCase(this._repository);

  @override
  Future<Either<Failure, List<BranchItem>>> execute(void input) async  {
    return await _repository.brands();
  }
}