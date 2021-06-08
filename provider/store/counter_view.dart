import 'package:flutter/cupertino.dart';

// 1.创建自己需要的共建共享数据
class CounterView extends ChangeNotifier {
  int _counter = 1001;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    //这个方法就是通知依赖当前数据的widget数据发生变化了
    notifyListeners();
  }
}
