import 'package:approducts/data/network/failure.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class CategoryUseCase implements BaseUseCase<void, List<dynamic>>{
  Repository _repository;
  CategoryUseCase(this._repository);

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> execute(void input) async {
   return await _repository.categories();
  }
}