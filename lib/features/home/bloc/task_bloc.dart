import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasko/core/helper/localdb.dart';
import 'package:tasko/features/home/model/task.dart';
import 'package:tasko/injector.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initialState) {
    on<GetTasksEvent>(_getTasksEventHandler);
    on<AddTaskEvent>(_addTaskEventHandler);
    on<CompleteTaskEvent>(_completeTaskEventHandler);
  }

  FutureOr<void> _getTasksEventHandler(
    GetTasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    // emit(state.copyWith(loading: true));
    try {
      final localDB = await sl.getAsync<LocalDB>();
      final tasks = await localDB.getTasks();
      final completedTasks = tasks.where((task) => task.isCompleted).toList();
      final unCompletedTasks =
          tasks.where((task) => !task.isCompleted).toList();
      emit(
        state.copyWith(
          completedTask: completedTasks,
          unCompletedTask: unCompletedTasks,
          loading: false,
          taskStateType: TaskStateType.taskFetched,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(loading: false, errorMessage: 'Something went wrong'),
      );
      throw Exception(e);
    }
  }

  FutureOr<void> _addTaskEventHandler(
    AddTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final localDB = await sl.getAsync<LocalDB>();
      await localDB.insertTask(event.task);
      emit(
        state.copyWith(
          loading: false,
          taskStateType: TaskStateType.taskAdded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(loading: false, errorMessage: 'Something went wrong'),
      );
      throw Exception(e);
    }
  }

  FutureOr<void> _completeTaskEventHandler(
    CompleteTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(loading: true));

    try {
      final localDB = await sl.getAsync<LocalDB>();
      final result = await localDB.completeTask(event.id);
      if (result == 1) {
        emit(
          state.copyWith(
            loading: false,
            taskStateType: TaskStateType.taskCompleted,
          ),
        );
        Future.delayed(const Duration(seconds: 5));
        add(GetTasksEvent());
      }
    } catch (e) {
      emit(
        state.copyWith(loading: false, errorMessage: 'Something went wrong'),
      );
      throw Exception(e);
    }
  }
}
