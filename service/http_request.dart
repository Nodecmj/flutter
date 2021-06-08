import 'package:dio/dio.dart';
import 'package:hello_flutter/service/config.dart';

class HttpRequest {
  // 基础设置
  static final BaseOptions baseOptions = new BaseOptions(
      baseUrl: httpConfig.baseUrl, connectTimeout: httpConfig.timeOut);

  // 创建dio并应用初始化基础设置
  static final Dio dio = new Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method, Map<String, dynamic> parma, Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);

    // 全局拦截器默认拦截器
    Interceptor defaultInterceptor = InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      print("请求拦截");
      return handler.next(options);
    }, onResponse: (
      Response e,
      ResponseInterceptorHandler handler,
    ) {
      print("响应拦截");
      return handler.next(e);
    }, onError: (
      DioError e,
      ErrorInterceptorHandler handler,
    ) {
      print("报错拦截");
      return handler.next(e);
    });
    List<Interceptor> list = [defaultInterceptor];
    // 判断当前请求是否有特定拦截器
    if (inter != null) {
      list.add(inter);
    }
    dio.interceptors.addAll(list);

    // 2.发送网络请求
    try {
      Response response =
          await dio.request(url, queryParameters: parma, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static Future get(url, {Map<String, dynamic> parma, Interceptor inter}) {
    return request(url, method: "get", parma: parma, inter: inter);
  }

  static Future post(url, {Map<String, dynamic> parma, Interceptor inter}) {
    return request(url, method: "post", parma: parma, inter: inter);
  }
}
