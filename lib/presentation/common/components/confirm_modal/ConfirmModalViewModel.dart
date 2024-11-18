import '../../../../domain/usecase/products_usecase.dart';
import '../../../base/baseviewmodel.dart';
import '../../state_render/state_render.dart';
import '../../state_render/state_render_impl.dart';

class ConfirmModalViewModel extends BaseViewModel
    implements ConfirmModalViewModelInputs {
  ProductsUsecase _productsUsecase;

  ConfirmModalViewModel(this._productsUsecase);

  @override
  void start() {}

  @override
  initTransferDatabaseLocal(){
    getProducts();
    getBranch();
    getCategory();
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
  Future<void> getProducts() async {
    (await _productsUsecase.execute(ProductsUseCaseInput(100, 1))).fold(
        (failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));

      Future.delayed(Duration(seconds: 3), () {
        inputState.add(ContentState());
      });
    }, (data) {
      print(data);
    });
  }
}

abstract class ConfirmModalViewModelInputs {
  initTransferDatabaseLocal();

  Future<void> getProducts();

  Future<void> getBranch();

  Future<void> getCategory();
}
