import 'package:approducts/domain/usecase/category_usecase.dart';

import '../../../../domain/usecase/products_usecase.dart';
import '../../../base/baseviewmodel.dart';
import '../../state_render/state_render.dart';
import '../../state_render/state_render_impl.dart';

class ConfirmModalViewModel extends BaseViewModel
    implements ConfirmModalViewModelInputs {
  ProductsUsecase _productsUseCase;
  CategoryUseCase _categoryUseCase;

  ConfirmModalViewModel(this._productsUseCase, this._categoryUseCase);

  @override
  void start() {}

  @override
  initTransferDatabaseLocal() {
    getProducts();
    getBranch();
    getCategory();
  }

  @override
  Future<void> getBranch() {
    throw UnimplementedError();
  }

  @override
  Future<void> getCategory() async {
    (await _categoryUseCase.execute(0)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      print(data);
    });
  }

  @override
  Future<void> getProducts() async {
    (await _productsUseCase.execute(ProductsUseCaseInput(100, 1))).fold(
        (failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
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
