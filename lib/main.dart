import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await load();
  await GetStorage.init();
  runApp(App());
}