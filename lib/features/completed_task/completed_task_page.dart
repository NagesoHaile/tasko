import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasko/core/helper/date_time_formatter.dart';
import 'package:tasko/features/home/bloc/task_bloc.dart';
import 'package:tasko/injector.dart';

class CompletedTaskPage extends StatelessWidget {
  CompletedTaskPage({super.key});
  static const String routeName = '/completed-task-page-route-name';
  final taskBloc = sl<TaskBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      bloc: taskBloc,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Completed Tasks'),
            ),
            body: () {
              if (state.completedTask.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    taskBloc.add(GetTasksEvent());
                  },
                  child: ListView.builder(
                    itemCount: state.completedTask.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.completedTask[index].title),
                        subtitle: Text(state.completedTask[index].title),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              DateTimeFormatter.formatDateTime(
                                state.completedTask[index].dueDate,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No Completed Tasks Yet.'),
                );
              }
            }());
      },
    );
  }
}
