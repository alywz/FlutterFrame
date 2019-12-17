import 'package:flutter/material.dart';

/*
 *系统主题设置，包括系统默认字体 背景色等
 */
class GlobalConfig {
  static bool isDebug = true; //是否是调试模式
  static const String baseUrl = "http://47.110.53.42:9999"; //baseUrl服务器地址(正式地址)
//  static const String baseUrl = "http://47.110.53.42:9999"; //baseUrl服务器地址(测试地址)
  static const int CONNECT_TIMEOUT = 10000;//连接服务器超时时间，单位是毫秒.
  static const int RECEIVE_TIMEOUT = 5000;////响应流上前后两次接受到数据的间隔，单位为毫秒。
  static bool dark = false;
  static Color fontColor = Colors.black54;
}
