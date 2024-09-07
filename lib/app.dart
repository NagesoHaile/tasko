import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasko/configs/theme/theme.dart';
import 'package:tasko/features/settings/bloc/settings_bloc.dart';
import 'package:tasko/features/settings/services/settings_service.dart';
import 'package:tasko/injector.dart';
import 'package:tasko/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SettingsBloc>(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: () {
              switch (state.appTheme) {
                case AppTheme.light:
                  return ThemeMode.light;
                case AppTheme.dark:
                  return ThemeMode.dark;
                case AppTheme.system:
                default:
                  return ThemeMode.system;
              }
            }(),
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
