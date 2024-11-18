import '../../domain/repository/local_db_repository.dart';
import '../base/baseviewmodel.dart';

class ProductViewModel extends BaseViewModel implements ProductViewModelInput{

  final LocalRepositoryDatabase _productLocalRepository = LocalRepositoryDatabase();

  ProductViewModel();

  @override
  Future<void> getProductById(int id) async{
    try{
      Map<String, dynamic>? product = await _productLocalRepository.getProductById(id);
    }catch(e){
      throw UnimplementedError();
    }
  }

  @override
  void start() {
    // TODO: implement start
  }


}

abstract class ProductViewModelInput {
  Future<void> getProductById(int id);
}
