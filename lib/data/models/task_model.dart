class Task {
  Task({
    this.taskId,
    required this.name,
    required this.finishDate,
    required this.type,
    required this.urgent,
    required this.status,
  });

  factory Task.fromMap(Map<String, dynamic> map) => Task(
        taskId: map['taskId'],
        name: map['name'],
        finishDate: map['formattedFinishDate'],
        type: map['type'],
        urgent: map['urgent'],
        status: map['status'],
      );

  Map<String, dynamic> toMap() => {
        'taskId': taskId,
        'name': name,
        'formattedFinishDate': finishDate,
        'type': type,
        'urgent': urgent,
        'status': status,
      };

  int status;
  final int type;
  String? taskId;
  final int urgent;
  final String name;
  final String finishDate;
}
