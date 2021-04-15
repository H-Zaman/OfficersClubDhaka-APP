import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await load();
  runApp(App());
}