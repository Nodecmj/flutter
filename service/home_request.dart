import 'config.dart';
import 'http_request.dart';
import '../douban/model/home_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestList() async {
    // 1.构建URL
    final movieURL = "get";

    //  2.发送网络请求获取结果
    final result = await HttpRequest.get(movieURL);
    List contentList = HomeConfig.top250;

    List<MovieItem> modelList = [];

    contentList.forEach((element) {
      modelList.add(new MovieItem.fromMap(element));
    });
    return modelList;
  }
}
