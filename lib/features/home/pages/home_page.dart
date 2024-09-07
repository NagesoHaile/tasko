import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/features/home/pages/add_task_page.dart';
import 'package:tasko/features/home/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/home-page-route-name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [],
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(AddTaskPage.routeName);
        },
        label: const Text('Add Task'),
      ),
    );
  }
}
