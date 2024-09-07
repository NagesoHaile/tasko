import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/core/colors/app_colors.dart';
import 'package:tasko/core/helper/date_time_formatter.dart';
import 'package:tasko/core/widgets/app_snack_bar.dart';
import 'package:tasko/core/widgets/app_text_field.dart';
import 'package:tasko/features/home/bloc/task_bloc.dart';
import 'package:tasko/features/home/model/task.dart';
import 'package:tasko/features/home/pages/add_task_page.dart';
import 'package:tasko/features/home/widgets/app_drawer.dart';
import 'package:tasko/features/show_quote/data/models/quote.dart';
import 'package:tasko/features/show_quote/presentation/bloc/quote_bloc.dart';
import 'package:tasko/features/show_quote/presentation/widgets/show_quote_dialog.dart';
import 'package:tasko/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  static const String routeName = '/home-page-route-name';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskBloc = sl<TaskBloc>();
  final quoteBloc = sl<QuoteBloc>();

  @override
  void initState() {
    super.initState();
    taskBloc.add(GetTasksEvent());
    quoteBloc.add(const QuoteEvent());
  }

  void _completeTask(int taskId) {
    taskBloc.add(CompleteTaskEvent(id: taskId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuoteBloc, QuoteState>(
      bloc: quoteBloc,
      listener: (context, quoteState) {
        if (quoteState is QuoteFetched) {
          DialogWidget.showQuoteDialog(
            context,
            quote: quoteState.quotes,
          );
        }
      },
      child: BlocConsumer<TaskBloc, TaskState>(
        bloc: taskBloc,
        listener: (context, state) {
          if (state.taskStateType == TaskStateType.taskCompleted) {
            AppSnackBar.showAppSnackBar(
              context: context,
              message: 'Task Completed',
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: () {
              if (state.unCompletedTask.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      taskBloc.add(GetTasksEvent());
                    },
                    child: ListView.builder(
                      itemCount: state.unCompletedTask.length,
                      itemBuilder: (context, index) {
                        final task = state.unCompletedTask[index];
                        return ListTile(
                          title: Text(state.unCompletedTask[index].title),
                          subtitle:
                              Text(state.unCompletedTask[index].description),
                          trailing: IconButton(
                            onPressed: () {
                              _completeTask(task.id!);
                            },
                            icon: const Icon(Icons.close),
                          ),
                          onTap: () {
                            _completeTask(task.id!);
                          },
                        );
                      },
                    ),
                  ),
                );
              } else if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else {
                return const Center(
                  child: Text('No Tasks'),
                );
              }
            }(),
            drawer: const AppDrawer(),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                context.pushNamed(AddTaskPage.routeName);
              },
              label: const Text('Add Task'),
            ),
          );
        },
      ),
    );
  }
}
