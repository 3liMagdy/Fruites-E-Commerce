

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);

  static Future<CacheHelper> create() async {
    final prefs = await SharedPreferences.getInstance();
    return CacheHelper(prefs);
  }

  String? getDataString({required String key}) {
    return _prefs.getString(key);
  }

  bool getBool({required String key}) {
    return _prefs.getBool(key) ?? false;
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) return await _prefs.setBool(key, value);
    if (value is String) return await _prefs.setString(key, value);
    if (value is int) return await _prefs.setInt(key, value);
    return await _prefs.setDouble(key, value as double);
  }

  dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }

  bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  Future<bool> clearData() async {
    return await _prefs.clear();
  }

  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) return await _prefs.setString(key, value);
    if (value is bool) return await _prefs.setBool(key, value);
    return await _prefs.setInt(key, value as int);
  }

  Future<bool> putBool({required String key, required bool value}) async {
    return await _prefs.setBool(key, value);
  }

  
}
