import 'package:approducts/data/data_resource/remote_data_source.dart';
import 'package:approducts/data/mapper/mapper.dart';
import 'package:approducts/data/network/failure.dart';
import 'package:approducts/data/network/error_handler.dart';
import 'package:approducts/data/network/network_info.dart';
import 'package:approducts/data/request/request.dart';
import 'package:approducts/data/responses/category.respose.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:approducts/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../responses/branches.response.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if(response.accessToken?.accessToken != null){
          return Right(response.toDomain());
        }else{
          return Left(Failure(402, "Error en el login de ingreso"));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  Future<Either<Failure, Products>> products(ProductsRequest productsRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.products(productsRequest);
        return Right(response.toDomain());
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, List<CategoryItem>>> categories() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.categories();
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure,  List<BranchItem>>> brands() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.branches();
        print("Aqui $response");
        return Right(response);
      } catch (error) {
        print("Aqui $error");
        return (Left(ErrorHandler.handle(error).failure));
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}



