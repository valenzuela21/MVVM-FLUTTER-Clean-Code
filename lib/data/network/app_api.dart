import 'package:approducts/data/responses/branches.response.dart';
import 'package:approducts/data/responses/category.respose.dart';
import 'package:approducts/data/responses/products.reponse.dart';
import 'package:approducts/data/responses/responses.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:approducts/app/constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _AppServiceClient;

  @POST('/auth/login')
  Future<AuthenticationResponse> login(
    @Field("username") String username,
    @Field("password") String password,
  );

  @GET('/products/list')
  Future<ProductListResponse> getProducts(
      @Query('page') int page,
      @Query('size') int size,
      );

  @GET('/categories/all')
  Future<List<CategoryItem>> getCategories();

  @GET('/brands/all')
  Future<List<BranchItem>> getBranches();

}

class ParseErrorLogger {
  void logError(Object e, StackTrace s, RequestOptions options) {
    print("Error Api: $e");
  }
}
