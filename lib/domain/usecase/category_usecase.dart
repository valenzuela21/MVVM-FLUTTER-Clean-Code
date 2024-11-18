import 'package:approducts/data/network/failure.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class ProductsUseCase implements BaseUseCase<void, List<Category>>{
  Repository _repository;
  ProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Category>>> execute(void input) async {
   return await _repository.categories();
  }
  
}