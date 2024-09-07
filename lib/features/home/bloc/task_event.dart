part of 'task_bloc.dart';

class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;
  const AddTaskEvent({required this.task});
}

class GetTasksEvent extends TaskEvent {}

class CompleteTaskEvent extends TaskEvent {
  final int id;
  const CompleteTaskEvent({required this.id});
}
