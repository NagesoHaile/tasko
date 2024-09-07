import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasko/features/settings/bloc/settings_bloc.dart';
import 'package:tasko/features/settings/services/settings_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String routeName = '/settings-page-route-name';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThemeOption(
                  title: 'Dark Theme',
                  value: (state.appTheme == AppTheme.light),
                  onTap: () {
                    if (state.appTheme == AppTheme.light) {
                      context.read<SettingsBloc>().add(
                            const ThemeChangedEvent(
                              appTheme: AppTheme.dark,
                            ),
                          );
                    } else if (state.appTheme == AppTheme.dark) {
                      context.read<SettingsBloc>().add(
                            const ThemeChangedEvent(
                              appTheme: AppTheme.light,
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThemeOption extends StatelessWidget {
  const ThemeOption({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });
  final String title;
  final bool value;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: value ? null : const Icon(Icons.check),
      //activeColor: AppColors.primaryColor,
      //checkColor: AppColors.whiteAppColor,
      title: Text(title),
      leading: value ? const Icon(Icons.sunny) : const Icon(Icons.dark_mode),
      //value: value,
      //controlAffinity: ListTileControlAffinity.trailing,
      onTap: onTap,
    );
  }
}
