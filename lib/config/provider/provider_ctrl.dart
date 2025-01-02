import 'package:flutter_demo/model/app_model.dart';
import 'package:flutter_demo/model/home_model.dart';
import 'package:flutter_demo/view_model/app_vm.dart';
import 'package:flutter_demo/view_model/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderCtrl {
  static List<SingleChildWidget> providers = [
    ..._independentServices,
    ...dependentServices,
  ];
  static final List<SingleChildWidget> _independentServices = [
    ChangeNotifierProvider(create: (_) => AppViewModel(model: AppModel())),
    ChangeNotifierProvider(create: (_) => HomeViewModel(model: HomeModel())),
  ];
  static List<SingleChildWidget> dependentServices = [];
}

//This is ProxyProvider custom other provider service
