import 'package:dio/dio.dart';

import 'http_request.dart';

// http请求静态类
class Http {
  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时时间
  /// [receiveTimeout] 接收超时时间
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  static void init({
    required String baseUrl,
    required int connectTimeout,
    required int receiveTimeout,
    required Map<String, dynamic> headers,
    required List<Interceptor> interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      interceptors: interceptors,
    );
  }

  /// 设置请求头
  static void setHeaders(Map<String, dynamic> headers) {
    HttpRequest().setHeaders(headers);
  }

  /// 取消请求
  static void cancelRequests({required CancelToken token}) {
    HttpRequest().cancelRequests(token: token);
  }

  /// restful get 操作
  static Future get(
    String path, {
    required Map<String, dynamic> params,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().get(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// restful post 操作
  static Future post(
    String path, {
    required Map<String, dynamic> params,
    dynamic data,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().post(
      path,
      params: params,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// restful post form 表单提交操作
  static Future postForm(
    String path, {
    required Map<String, dynamic> params,
    required Options options,
    required CancelToken cancelToken,
  }) async {
    return await HttpRequest().postForm(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
