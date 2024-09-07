class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime dueDate;
  bool isCompleted; // Task completion status (Completed/Incomplete)

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as int,
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['due_date']),
      isCompleted: json['is_completed'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'due_date': dueDate.toIso8601String(),
      'is_completed': isCompleted ? 1 : 0,
    };
  }
}
