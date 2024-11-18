import 'package:approducts/app/app_prefs.dart';
import 'package:approducts/data/data_resource/remote_data_source.dart';
import 'package:approducts/data/network/app_api.dart';
import 'package:approducts/data/network/dio_factory.dart';
import 'package:approducts/data/network/network_info.dart';
import 'package:approducts/data/repository/repository_impl.dart';
import 'package:approducts/domain/repository/repository.dart';
import 'package:approducts/domain/usecase/branches_usecase.dart';
import 'package:approducts/domain/usecase/category_usecase.dart';
import 'package:approducts/domain/usecase/login_usecase.dart';
import 'package:approducts/domain/usecase/products_usecase.dart';
import 'package:approducts/presentation/common/components/confirm_modal/ConfirmModalViewModel.dart';
import 'package:approducts/presentation/login/LoginViewModel.dart';
import 'package:approducts/presentation/products/ProductsViewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {

  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));


  // Network Info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnection()));


  //Register Dio Factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // App Service Client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // Remote Data Resource
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImplementer(instance()));

  // Repository
  instance.registerLazySingleton<Repository>(()=> RepositoryImpl(instance(), instance()));

}

initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() =>  LoginViewModel(instance()));
  }
}

initProductsModule(){
  if(!GetIt.I.isRegistered<ProductsUseCase>()){
    instance.registerFactory<ProductsUseCase>(() => ProductsUseCase(instance()));
    instance.registerFactory<CategoryUseCase>(() => CategoryUseCase(instance()));
    instance.registerFactory<BranchesUseCase>(() => BranchesUseCase(instance()));
    instance.registerFactory<ProductsViewModel>(() =>  ProductsViewModel(instance()));
    instance.registerFactory<ConfirmModalViewModel>(() => ConfirmModalViewModel(instance(), instance(), instance()));
  }
}


resetModules(){
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initProductsModule();
}
