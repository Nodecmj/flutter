import 'package:flutter/material.dart';
import 'package:hello_flutter/provider/store/counter_view.dart';
import 'package:provider/provider.dart';

/**
 *  1.创建自己需要共享的数据
 *  2.在应用程序的顶层创建changeNotifierProvider
 *  3.在其他位置使用共享的数据
 *    > Provider.of：当Provider中的数据发生改变时，Provider.of所在的Widget整个build方法都会重新构建
 *    > Consumer（相对推荐）：当Provider中的数据发生改变时，重新执行Consumer的builder
 *    > Selector：selector方法（作用，对原有的数据进行转换）2.shouldRebuild（作用，要不要重新构建）
 *    > Consumer 和 Selector搭配使用，如果有依赖数据 那就用Consumer。如果只是修改数据 没有依赖数据，那么就用Selector（Selector可以让只修改的widget不进行重新构建）
 *  */

main() {
  runApp(
      // 2.在应用程序的顶层创建changeNotifierProvider
      ChangeNotifierProvider(
    create: (ctx) => CounterView(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

  Scaffold HomePage() {
    return Scaffold(
      appBar: AppBar(title: Text("状态管理")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowData1(),
            ShowData2(),
          ],
        ),
      ),
      floatingActionButton: Selector<CounterView, CounterView>(
        selector: (ctx, CounterView) => CounterView,
        shouldRebuild: (prev, next) => false,
        builder: (ctx, counterVw, child) {
          return FloatingActionButton(
            child: child,
            onPressed: () {
              counterVw.counter++;
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ShowData2 extends StatelessWidget {
  const ShowData2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("data2执行");

    // 3.在其他位置使用共享的数据
    int counter = Provider.of<CounterView>(context).counter;
    return Card(
      color: Colors.orange,
      child: Text(
        "当前计数:$counter",
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class ShowData1 extends StatelessWidget {
  const ShowData1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("data1执行");
    return Consumer<CounterView>(
      builder: (ctx, counterVm, child) {
        return Card(
          color: Colors.deepOrange,
          child: Text(
            "当前计数:${counterVm.counter}",
            style: TextStyle(fontSize: 28),
          ),
        );
      },
    );
  }
}
