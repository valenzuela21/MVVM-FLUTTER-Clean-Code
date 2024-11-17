import 'package:approducts/presentation/base/baseviewmodel.dart';

import '../common/state_render/state_render_impl.dart';

class ProductsViewModel extends BaseViewModel{

  @override
  void start() {
    inputState.add(ContentState());
  }

}