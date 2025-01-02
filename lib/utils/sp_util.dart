import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synchronized/synchronized.dart';

class SpUtil {
  static SpUtil? _singleton;
  static late SharedPreferences _prefs;
  static final Lock _lock = Lock();

  static Future<SpUtil> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = SpUtil._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }
    return _singleton!;
  }

  SpUtil._();

  Future<void> _init() async => _prefs = await SharedPreferences.getInstance();

  ///存储String
  static Future<void> setString(String key, String? value) async {
    if (value == null) return;
    await _prefs.setString(key, value);
  }

  ///存储Int
  static Future<void> setInt(String key, int? value) async {
    if (value == null) return;
    await _prefs.setInt(key, value);
  }

  ///存储StringList
  static Future<void> setStringList(String key, List<String>? value) async {
    if (value == null) return;
    await _prefs.setStringList(key, value);
  }

  /// 根据key存储Object类型
  static Future<void> putObject(String key, Object? value) async {
    if (value == null) return;
    await _prefs.setString(key, json.encode(value));
  }

  /// 根据key获取T泛型类型
  static Map? getMap(String key) {
    String? data = _prefs.getString(key);
    return data != null ? json.decode(data) : null;
  }

  ///获取String
  static String? getString(String key) {
    String? value = _prefs.getString(key);
    return value;
  }

  ///获取Int
  static int? getInt(String key) {
    int? value = _prefs.getInt(key);
    return value;
  }

  ///获取String
  static List<String>? getStringList(String key) {
    List<String>? status = _prefs.getStringList(key);
    return status;
  }

  ///获取bool
  /// 根据key获取bool类型
  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  /// setBool
  static Future<void> setBool(String key, bool? value) async {
    if (value == null) return;
    await _prefs.setBool(key, value);
  }

  ///getValue
  static dynamic getValue(String key) {
    debugPrint("取值${_prefs.getStringList(key)}");
    return _prefs.get(key);
  }

  static T? getObj<T>(String key, T Function(dynamic data2) fromJsonT) {
    String? data = _prefs.getString(key);
    if (data == null) return null;
    Map map = json.decode(data);

    return fromJsonT(map);
  }

  static List<T>? getObjList<T>(String key, T Function(dynamic data2) fromJsonT) {
    String? data = _prefs.getString(key);
    if (data == null) return null;
    List<dynamic> list = json.decode(data);
    return list.map<T>((item) => fromJsonT(item)).toList();
  }

  ///获取所有key
  static Set<String> getKeys() {
    return _prefs.getKeys();
  }

  /// 删除key
  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  static removeAll() {
    _prefs.getKeys().forEach((key) {
      _prefs.remove(key);
    });
  }
}
