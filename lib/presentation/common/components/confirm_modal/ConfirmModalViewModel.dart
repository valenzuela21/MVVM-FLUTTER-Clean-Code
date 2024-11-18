import 'dart:ffi';

import 'package:approducts/data/responses/category.respose.dart';
import 'package:approducts/domain/model/model.dart';
import 'package:approducts/domain/repository/local_db_repository.dart';
import 'package:approducts/domain/usecase/branches_usecase.dart';
import 'package:approducts/domain/usecase/category_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../domain/usecase/products_usecase.dart';
import '../../../base/baseviewmodel.dart';
import '../../state_render/state_render.dart';
import '../../state_render/state_render_impl.dart';

class ConfirmModalViewModel extends BaseViewModel
    implements ConfirmModalViewModelInputs {
  LocalRepositoryDatabase localRepositoryDatabase = LocalRepositoryDatabase();

  ProductsUseCase _productsUseCase;
  CategoryUseCase _categoryUseCase;
  BranchesUseCase _branchesUseCase;

  ConfirmModalViewModel(this._categoryUseCase, this._branchesUseCase, this._productsUseCase);

  @override
  void start() {

  }

  @override
  initTransferDatabaseLocal(BuildContext context) async {
    try {
      await Future.wait([getProducts(), getBranch(), getCategory()]);
      inputState.add(ContentState());
      Phoenix.rebirth(context);
    } catch (e) {
      inputState.add(ContentState());
      inputState
          .add(ErrorState(StateRendererType.POPUP_ERROR_STATE, e.toString()));
    }
  }

  @override
  Future<void> getBranch() async {
    (await _branchesUseCase.execute(Void)).fold((failure) {
      print("ERROR BRANCH: ${failure.message} ${failure.code}");
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      for (var brand in data) {
        localRepositoryDatabase.insertBrand(brand);
      }
    });
  }

  @override
  Future<void> getCategory() async {
    (await _categoryUseCase.execute(Void)).fold((failure) {
      print("ERROR CATEGORY: ${failure.message} ${failure.code}");
      inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message));
    }, (data) {
      for (var category in data) {
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
  initTransferDatabaseLocal(BuildContext context);

  Future<void> getProducts();

  Future<void> getBranch();

  Future<void> getCategory();

}
