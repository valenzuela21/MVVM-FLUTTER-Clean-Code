import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_TOKEN = "PREFS_KEY_TOKEN";
const String PREFS_KEY_IS_USER_LOGGEN_IN = "PREFS_KEY_IS_USER_LOGGEN_IN";

class AppPreferences {
  SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.SPANISH.getValue()) {
      // save prefs with english lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // save prefs with arabic lang
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.SPANISH.getValue());
    }
  }

  Future<void> setUserToken(String token)  async{
      _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";
  }

  Future<void> setIsUserLoogedIn() async {
     _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGEN_IN, true);
  }

  Future<bool> getIsUserLoogedIn() async {
   return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGEN_IN) ?? false;
  }

  Future<Locale> getLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.SPANISH.getValue()) {
      // return arabic local
      return SPANISH_LOCAL;
    } else {
      // return english local
      return ENGLISH_LOCAL;
    }
  }
}