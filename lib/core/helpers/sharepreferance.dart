import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> storeValue({required String value, required String keyValue}) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    try {
      bool isStored = await instance.setString(keyValue, value);
      if (isStored) {
        debugPrint('Cookie stored in SP');
      } else {
        debugPrint('Cookie not stored in SP');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
