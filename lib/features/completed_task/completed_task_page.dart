import 'package:flutter/material.dart';

class CompletedTaskPage extends StatelessWidget {
  const CompletedTaskPage({super.key});
  static const String routeName = '/completed-task-page-route-name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
    );
  }
}
