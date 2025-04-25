enum Priority { low, medium, high }

class Todo {
  String title;
  bool isCompleted;
  DateTime? dueDate;
  Priority priority;
  String category;
  DateTime createdAt;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.dueDate,
    this.priority = Priority.medium,
    this.category = 'General',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Todo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? dueDate,
    Priority? priority,
    String? category,
  }) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      createdAt: this.createdAt,
    );
  }
} 