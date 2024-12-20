import 'package:approducts/data/network/failure.dart';
import 'package:approducts/data/request/request.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:approducts/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class ProductsUseCase implements BaseUseCase<ProductsUseCaseInput, Products>{

  Repository _repository;
  ProductsUseCase(this._repository);

  @override
  Future<Either<Failure, Products>> execute(ProductsUseCaseInput input) async {
    return await _repository.products(ProductsRequest(input.page, input.size));
  }
}

class ProductsUseCaseInput {
  int size;
  int page;
  ProductsUseCaseInput(this.size, this.page);
}