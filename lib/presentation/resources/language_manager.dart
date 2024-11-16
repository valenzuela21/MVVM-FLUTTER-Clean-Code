import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, SPANISH }

const String SPANISH = "es";
const String ENGLISH = "en";
const String ASSETS_PATH_LOCALISATIONS = "assets/translations";
const Locale SPANISH_LOCAL = Locale("es","ES");
const Locale ENGLISH_LOCAL = Locale("en","US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.SPANISH:
        return SPANISH;
    }
  }
}