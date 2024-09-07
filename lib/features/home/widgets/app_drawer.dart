import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/core/colors/app_colors.dart';
import 'package:tasko/features/completed_task/completed_task_page.dart';
import 'package:tasko/features/home/pages/home_page.dart';
import 'package:tasko/features/settings/pages/settings_page.dart';
import 'package:tasko/router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Center(
                child: Text(
                  'Tasko',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            // menu
            ListTile(
              onTap: () {
                context.pop();
              },
              title: const Text('Home'),
              leading: const Icon(Icons.home),
            ),
            ListTile(
              onTap: () {
                context.pushNamed(CompletedTaskPage.routeName);
              },
              title: const Text('Completed'),
              leading: const Icon(Icons.done),
            ),
            ListTile(
              onTap: () {
                context.pushNamed(SettingsPage.routeName);
              },
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
