import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/domain/usecase/products_usecase.dart';
import 'package:approducts/presentation/base/baseviewmodel.dart';
import '../common/state_render/state_render.dart';
import '../common/state_render/state_render_impl.dart';

class ProductsViewModel extends BaseViewModel implements ProductsViewModelInputs {

  final LocalRepositoryDatabase _productRepository = LocalRepositoryDatabase();

  ProductsUsecase _productsUsecase;

  ProductsViewModel(this._productsUsecase);

  @override
  void start() async {
    inputState.add(ContentState());
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    try {
      final productCount = await _productRepository.getProductCount();
      inputState.add(ProductCountState(message: productCount.toString()));
    }catch(error){
      inputState.add(ErrorState(
          StateRendererType.POPUP_ERROR_STATE, error.toString()));
    }
  }

  @override
  Future<void> getBranch() {
    // TODO: implement getBranch
    throw UnimplementedError();
  }

  @override
  Future<void> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<void> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  void dispose() {
    super.dispose();
  }

}

abstract class ProductsViewModelInputs {
  Future<void> getProducts();

  Future<void> getBranch();

  Future<void> getCategory();
}

