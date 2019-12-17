import 'dart:io';

import 'package:dio/dio.dart';
import 'package:douban_app/entity_factory.dart';
import 'dart:async';

import 'package:douban_app/http/GlobalConfig.dart';

/*
 * Aly
 *封装 restful 请求
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class HttpUtils {
  /// global dio object
  static Dio dio;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  ///Get请求测试
  static void getHttp<T>(String url,{parameters, Function(T t) onSuccess, Function(String error) onError,}) async {
    try {
      Response response;
      Dio dio = getInstance();
      response = await dio.get(url, queryParameters: parameters);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          //请求成功
          onSuccess(response.data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      //请求出错
      onError(e.toString());
    }
  }

  ///Post请求测试
  static void postHttp<T>(String url, {parameters, Function(T t) onSuccess, Function(String error) onError,}) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    try {
      Response response;
      Dio dio = getInstance();
      response = await dio.post(url, data: parameters);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          //请求成功
          onSuccess(response.data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } catch (e) {
      //请求出错
      onError(e.toString());
    }
  }

  /// request method
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static Future<Map> request<T>(String url, {parameters,method, Function(T t) onSuccess, Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    Dio dio = getInstance();
    //请求结果
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          //请求成功
          onSuccess(result);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } on DioError catch (e) {
      //请求出错
      onError(e.toString());
    }

    return result;
  }

  /// 创建 dio 实例对象
  static Dio getInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
          connectTimeout: GlobalConfig.CONNECT_TIMEOUT,
          receiveTimeout: GlobalConfig.RECEIVE_TIMEOUT,
          //请求的Content-Type，默认值是[ContentType.json]. 也可以用ContentType.parse("application/x-www-form-urlencoded")
          contentType:ContentType.json.toString(),
          //表示期望以那种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          baseUrl: GlobalConfig.baseUrl,
          headers: {
            "Authorization": '_token',
          });
      dio = new Dio(options);
      // 添加拦截器
      if (GlobalConfig.isDebug) {
        dio.interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
          print("\n========================== 请求数据 ==========================");
          print("url =${options.method} ${options.uri.toString()}");
          print("headers = ${options.headers}");
          print("params = ${options.data}");
        }, onResponse: (Response response) {
          print("\n========================== 响应数据 ==========================");
          print("code = ${response.statusCode}");
          print("data = ${response.data}");
          print("\n");
        }, onError: (DioError e) {
          print("\n========================= 错误响应数据 =========================");
          print("type = ${e.type}");
          print("message = ${e.message}");
          print("\n");
        }));
      }
    }
    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}
