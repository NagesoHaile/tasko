import 'package:flutter/material.dart';
import 'package:tasko/app.dart';
import 'package:tasko/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const App());
}
