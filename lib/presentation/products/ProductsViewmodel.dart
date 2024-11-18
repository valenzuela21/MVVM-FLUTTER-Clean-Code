import 'dart:async';

import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/domain/usecase/products_usecase.dart';
import 'package:approducts/presentation/base/baseviewmodel.dart';
import '../common/state_render/state_render.dart';
import '../common/state_render/state_render_impl.dart';

class ProductsViewModel extends BaseViewModel
    implements ProductsViewModelInputs, ProductsViewModelOutput {
  final LocalRepositoryDatabase _productLocalRepository =
      LocalRepositoryDatabase();

  final StreamController<List<Map<String, dynamic>>> _productsController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  ProductsUseCase _productsUsecase;

  ProductsViewModel(this._productsUsecase);

  @override
  void start() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    try {
      final productCount = await _productLocalRepository.getProductCount();
      inputState.add(ProductCountState(message: productCount.toString()));
    } catch (error) {
      inputState.add(ProductCountState(message: ""));
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, error.toString()));
    }
  }

  Future<void> loadProducts() async {
    try {
      List<Map<String, dynamic>> products =
          await _productLocalRepository.getProducts();
      _productsController.sink.add(products);
    } catch (e) {
      _productsController.sink.addError("Error loading products: $e");
    }
  }

  @override
  Future<void> getSearchProducts(String name) async {
    try {
      List<Map<String, dynamic>> searchResult =
          await _productLocalRepository.searchProducts(name);
      _productsController.sink.add(searchResult);
    } catch (e) {
      _productsController.sink.addError("Error loading products: $e");
    }
  }

  @override
  void dispose() {
    _productsController.close();
    super.dispose();
  }

  Stream<List<Map<String, dynamic>>> get productsStream =>
      _productsController.stream;
}

abstract class ProductsViewModelInputs {
  Future<void> loadProducts();

  Future<void> getSearchProducts(String name);
}

abstract class ProductsViewModelOutput {
  Stream<List<Map<String, dynamic>>> get productsStream;
}
