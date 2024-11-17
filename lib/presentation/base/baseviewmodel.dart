import 'dart:async';
import 'package:approducts/presentation/common/state_render/state_render_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    implements BaseViewModelOutputs {

  final BehaviorSubject<FlowState> _inputStateStreamController = BehaviorSubject<FlowState>();

  @override
  Sink<FlowState> get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStateStreamController.stream.map((flowstate) => flowstate);

  @override
  void dispose() {
    _inputStateStreamController.close();

  }
}


abstract class BaseViewModelInputs {
  void start();
  void dispose();

  Sink<FlowState> get inputState;
}


abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
