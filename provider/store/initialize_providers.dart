import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'counter_view.dart';
import 'user_view_model.dart';
import '../model/user_info.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => CounterView(),),
  ChangeNotifierProvider(create: (ctx) => UserViewModel(UserInfo("cmj", 22, "abc")),),
];