import 'package:approducts/data/network/failure.dart';
import 'package:approducts/data/request/request.dart';
import 'package:approducts/data/responses/category.respose.dart';
import 'package:dartz/dartz.dart';
import '../../data/responses/branches.response.dart';
import '../model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Products>> products(ProductsRequest productsRequest);
  Future<Either<Failure, List<CategoryItem>>> categories();
  Future<Either<Failure, List<BranchItem>>> brands();
}