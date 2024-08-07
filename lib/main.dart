import 'package:aduio_player/core/routing/app_router.dart';
import 'package:aduio_player/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/di/service_locator.dart';
import 'data/services/hive_box.dart';

void main() async {
  // initialize flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency injection
  init();

  // ask for permission to access media if not granted
  if (!await Permission.mediaLibrary.isGranted) {
    await Permission.mediaLibrary.request();
  }

  // initialize hive
  await Hive.initFlutter();
  await Hive.openBox(HiveBox.boxName);

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
