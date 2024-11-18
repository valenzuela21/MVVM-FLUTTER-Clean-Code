import 'dart:async';

import '../../domain/repository/local_db_repository.dart';
import '../base/baseviewmodel.dart';

class DetailViewModel extends BaseViewModel implements ProductViewModelInput, ProductViewModelOutput{

  final LocalRepositoryDatabase _productLocalRepository = LocalRepositoryDatabase();

  final StreamController <Map<String, dynamic>> _productController = StreamController <Map<String, dynamic>>.broadcast();

  DetailViewModel();

  @override
  Future<void> getProductById(int id) async{
    try{
      Map<String, dynamic>? product = await _productLocalRepository.getProductById(id);
      _productController.sink.add(product!);
    }catch(e){
      _productController.sink.addError("Error loading product: $e");
    }
  }

  @override
  void start() {
    // TODO: implement start
  }

  Stream<Map<String, dynamic>> get productStream => _productController.stream;

}

abstract class ProductViewModelInput {
  Future<void> getProductById(int id);

}

abstract class ProductViewModelOutput {
  Stream<Map<String, dynamic>> get productStream;
}
