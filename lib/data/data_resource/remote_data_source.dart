import 'package:approducts/data/network/app_api.dart';
import 'package:approducts/data/request/request.dart';
import 'package:approducts/data/responses/products.reponse.dart';
import 'package:approducts/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ProductListResponse> products(ProductsRequest productsRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.username, loginRequest.password);
  }

  @override
  Future<ProductListResponse> products(ProductsRequest productsRequest) async {
    return await _appServiceClient.getProducts(productsRequest.page, productsRequest.size);
  }


  
}