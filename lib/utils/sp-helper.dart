import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  // 静态变量_instance，存储唯一对象
  static late SpHelper _instance;
  late SharedPreferences prefs;

  // instance的getter方法，SpHelper.instance获取对象
  static SpHelper get instance => _getInstance();

  // 工厂方法构造函数
  factory SpHelper() => _getInstance();

  // 获取对象
  static SpHelper _getInstance() {
    _instance = SpHelper._internal();
    return _instance;
  }

  SpHelper._internal() {
    SharedPreferences.getInstance().then((value) => prefs = value);
  }

  // 存数据
  static Object savePreference(
    BuildContext context,
    String key,
    Object value,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw new Exception("不能得到这种类型");
    }
  }

  // 取数据
  static Future getPreference(
    Object context,
    String key,
    Object defaultValue,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (defaultValue is int) {
      return prefs.getInt(key);
    } else if (defaultValue is double) {
      return prefs.getDouble(key);
    } else if (defaultValue is bool) {
      return prefs.getBool(key);
    } else if (defaultValue is String) {
      return prefs.getString(key);
    } else if (defaultValue is List) {
      return prefs.getStringList(key);
    } else {
      throw new Exception("不能得到这种类型");
    }
  }

  // 获取任意值的key
  static void getAny(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.get(key);
  }

  // 获取所有值
  static void getKeys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getKeys();
  }

  // 如果持久化数据中存在给定的key则返回true
  static void containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.containsKey(key); //删除指定键
  }

  // 删除指定数据
  static void remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key); //删除指定键
  }

  // 清空整个缓存
  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // 重新加载缓存的share
  static void reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
  }
}
