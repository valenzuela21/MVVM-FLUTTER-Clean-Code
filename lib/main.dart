import 'package:approducts/app/app.dart';
import 'package:approducts/app/di.dart';
import 'package:approducts/presentation/resources/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'data/data_resource/local_data_sqlift.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database;
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      supportedLocales: [SPANISH_LOCAL, ENGLISH_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp())));
}
