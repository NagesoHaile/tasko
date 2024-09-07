import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/core/widgets/app_snack_bar.dart';
import 'package:tasko/core/widgets/app_text_field.dart';
import 'package:tasko/features/home/bloc/task_bloc.dart';
import 'package:tasko/features/home/model/task.dart';
import 'package:tasko/features/home/pages/home_page.dart';
import 'package:tasko/injector.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});
  static const String routeName = 'add-task-page-route-name';

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final formKey = GlobalKey<FormState>();
  final taskBloc = sl<TaskBloc>();
  Widget sizedBox = const SizedBox(
    height: 12,
  );

  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  DateTime? _dueDate;

  // Function to show DatePicker
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _dueDate = finalDateTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      bloc: taskBloc,
      listener: (context, state) {
        if (state.taskStateType == TaskStateType.taskAdded) {
          AppSnackBar.showAppSnackBar(
            context: context,
            message: 'Task Added Successfully.',
          );
          taskBloc.add(GetTasksEvent());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  taskBloc.add(GetTasksEvent());
                  context.goNamed(HomePage.routeName);
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            title: const Text('Add Task'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    sizedBox,
                    sizedBox,
                    AppTextField(
                      controller: titleController,
                      label: 'Title',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    sizedBox,
                    AppTextField(
                      controller: descriptionController,
                      label: 'Description',
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                    ),
                    sizedBox,
                    sizedBox,
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _dueDate == null
                                ? 'No Date Chosen!'
                                : '${_dueDate!.toLocal()}'.split(' ')[0],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _selectDueDate(context);
                          },
                          child: const Text('Select Due Date'),
                        )
                      ],
                    ),
                    sizedBox,
                    sizedBox,
                    state.loading
                        ? const CircularProgressIndicator(
                            strokeWidth: 0.5,
                          )
                        : sizedBox,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            if (_dueDate == null) {
                              AppSnackBar.showAppSnackBar(
                                  context: context,
                                  message: 'Due date is required',
                                  color: Colors.red);
                              return;
                            }
                            taskBloc.add(
                              AddTaskEvent(
                                task: Task(
                                  id: null,
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  dueDate: _dueDate!,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
