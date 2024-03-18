import 'dart:convert';
import 'dart:math';

import 'package:birthday_app/app/routes/app_pages.dart';
import 'package:birthday_app/models/user_model.dart';
import 'package:birthday_app/static_data.dart';
import 'package:birthday_app/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Set a string value in SharedPreferences
  static Future<void> setString(String key, String value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setString(key, value);
  }

  // Get a string value from SharedPreferences
  static String? getString(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getString(key);
  }

  // Remove a value from SharedPreferences
  static Future<void> remove(String key) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.remove(key);
  }

  // Set a boolean value in SharedPreferences
  static Future<void> setBool(String key, bool value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setBool(key, value);
  }

  // Get a boolean value from SharedPreferences
  static bool? getBool(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getBool(key);
  }

  // Set an integer value in SharedPreferences
  static Future<void> setInt(String key, int value) async {
    if (_preferences == null) {
      await initialize();
    }
    await _preferences!.setInt(key, value);
  }

  // Get an integer value from SharedPreferences
  static int? getInt(String key) {
    if (_preferences == null) {
      return null;
    }
    return _preferences!.getInt(key);
  }

  static String selectLanguage_pred = "selectLanguage";
  static String uuid_pref = "uuid";
  static String user_model_pred = "userModel";

  static setLanguagePref() {
    SharedPreferencesHelper.setBool(selectLanguage_pred, true);
  }

  static bool getLanguagePref() {
    return SharedPreferencesHelper.getBool(selectLanguage_pred) != null
        ? true
        : false;
  }

  static saveUserInfo(UserModel usermodel, String? id) {
    SharedPreferencesHelper.setString(uuid_pref, id!);
    SharedPreferencesHelper.setString(user_model_pred, usermodel.toJson());

    StaticData.userModel = usermodel;
    StaticData.uuid = id;
    logger.d(
        "!!!!!!!! save id in pref is  $id || user model is ${usermodel.toMap()} !!!!!!");
  }

  static bool isUserLogin() {
    UserModel? retrievedUserModel;
    final _uuid = SharedPreferencesHelper.getString(uuid_pref);
    if (_uuid != null) {
      retrievedUserModel = UserModel.fromJson(
          SharedPreferencesHelper.getString(user_model_pred)!);
    }
    logger.d(
        "!!!!!!!!!!!get from  pref  user id is $_uuid  &&  user model ${_uuid != null ? retrievedUserModel!.toMap() : "empty model"} !!!!!!!!!");

    StaticData.uuid = _uuid;
    StaticData.userModel = retrievedUserModel;

    return _uuid == null ? false : true;
  }
}
