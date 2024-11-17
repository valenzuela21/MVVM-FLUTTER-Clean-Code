import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/presentation/base/baseviewmodel.dart';
import '../common/state_render/state_render.dart';
import '../common/state_render/state_render_impl.dart';

class ProductsViewModel extends BaseViewModel {

  final LocalRepositoryDatabase _productRepository = LocalRepositoryDatabase();

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
  void dispose() {
    super.dispose();
  }

}

