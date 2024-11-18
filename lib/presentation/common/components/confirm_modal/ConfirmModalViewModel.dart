import 'package:approducts/data/responses/category.respose.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/domain/usecase/branches_usecase.dart';
import 'package:approducts/domain/usecase/category_usecase.dart';

import '../../../../domain/usecase/products_usecase.dart';
import '../../../base/baseviewmodel.dart';
import '../../state_render/state_render.dart';
import '../../state_render/state_render_impl.dart';

class ConfirmModalViewModel extends BaseViewModel
    implements ConfirmModalViewModelInputs {
  LocalRepositoryDatabase localRepositoryDatabase = LocalRepositoryDatabase();

  ProductsUsecase _productsUseCase;
  CategoryUseCase _categoryUseCase;
  BranchesUseCase _branchesUseCase;

  ConfirmModalViewModel(
      this._productsUseCase, this._categoryUseCase, this._branchesUseCase);

  @override
  void start() {}

  @override
  initTransferDatabaseLocal() async {
    try {
      await Future.wait([getProducts(), getBranch(), getCategory()]);
    } catch (e) {
      inputState
          .add(ErrorState(StateRendererType.POPUP_ERROR_STATE, e.toString()));
    }
  }

  @override
  Future<void> getBranch() async {
    (await _branchesUseCase.execute(0)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      List<Map<String, dynamic>> brandMap = data.map((Brand brandItem) {
        return brandItem.toMap();
      }).toList();

      for (var brand in brandMap) {
        localRepositoryDatabase.insertBrand(brand);
      }
    });
  }

  @override
  Future<void> getCategory() async {
    (await _categoryUseCase.execute(0)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      List<Map<String, dynamic>> categoryMap = data.map((Category categoryItem) {
        return categoryItem.toMap();
      }).toList();

      for (var category in categoryMap) {
        localRepositoryDatabase.insertCategory(category);
      }
    });
  }

  @override
  Future<void> getProducts() async {
    (await _productsUseCase.execute(ProductsUseCaseInput(100, 1))).fold(
        (failure) {
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      List<Map<String, dynamic>>? productsMap =
          data.items?.map((ProductItem productItem) {
        return productItem.toMap();
      }).toList();

      if (productsMap is List) {
        for (var product in productsMap!) {
          localRepositoryDatabase.insertProduct(product);
        }
      }
    });
  }
}

abstract class ConfirmModalViewModelInputs {
  initTransferDatabaseLocal();

  Future<void> getProducts();

  Future<void> getBranch();

  Future<void> getCategory();
}
