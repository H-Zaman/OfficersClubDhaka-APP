import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await load();
  await GetStorage.init();
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => App(), // Wrap your app
  // ));
  runApp(App());
}