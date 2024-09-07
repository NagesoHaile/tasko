import 'package:flutter/material.dart';
import 'package:tasko/configs/theme/theme.dart';
import 'package:tasko/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: Style.light,
      darkTheme: Style.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
