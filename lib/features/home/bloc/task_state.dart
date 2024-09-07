part of 'task_bloc.dart';

class TaskState extends Equatable {
  const TaskState(
      {required this.completedTask,
      required this.unCompletedTask,
      this.loading = false,
      this.errorMessage,
      required this.taskStateType});

  final List<Task> completedTask;
  final List<Task> unCompletedTask;
  final bool loading;
  final String? errorMessage;
  final TaskStateType taskStateType;

  static const initialState = TaskState(
    completedTask: [],
    unCompletedTask: [],
    errorMessage: null,
    taskStateType: TaskStateType.initial,
  );
  @override
  List<Object?> get props => [
        completedTask,
        unCompletedTask,
        loading,
        errorMessage,
      ];

  TaskState copyWith({
    List<Task>? completedTask,
    List<Task>? unCompletedTask,
    String? errorMessage,
    bool? loading,
    TaskStateType? taskStateType,
  }) {
    return TaskState(
      completedTask: completedTask ?? this.completedTask,
      unCompletedTask: unCompletedTask ?? this.unCompletedTask,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      taskStateType: taskStateType ?? this.taskStateType,
    );
  }
}

enum TaskStateType {
  initial,
  taskAdded,
  taskFetched,
  taskCompleted;
}
