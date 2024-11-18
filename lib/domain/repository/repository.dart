import 'package:approducts/data/network/failure.dart';
import 'package:approducts/data/request/request.dart';
import 'package:dartz/dartz.dart';
import '../model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, Products>> products(ProductsRequest productsRequest);
  Future<Either<Failure, List<Map<String, dynamic>>>> categories();
  Future<Either<Failure, List<Map<String, dynamic>>>> brands();
}