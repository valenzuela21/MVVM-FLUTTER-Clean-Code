import 'package:approducts/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class BranchesUseCase implements BaseUseCase<void, List<dynamic>>{
  Repository _repository;
  BranchesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> execute(void input) async  {
    return await _repository.brands();
  }
}