import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/domain/usecase/products_usecase.dart';
import 'package:approducts/presentation/base/baseviewmodel.dart';
import '../common/state_render/state_render.dart';
import '../common/state_render/state_render_impl.dart';

class ProductsViewModel extends BaseViewModel {

  final LocalRepositoryDatabase _productLocalRepository = LocalRepositoryDatabase();

  ProductsUsecase _productsUsecase;

  ProductsViewModel(this._productsUsecase);

  @override
  void start() async {

    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    try {
      final productCount = await _productLocalRepository.getProductCount();
      inputState.add(ProductCountState(message: productCount.toString()));
    }catch(error){
      inputState.add(ProductCountState(message: ""));
      inputState.add(ErrorState(
          StateRendererType.POPUP_ERROR_STATE, error.toString()));
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

}


