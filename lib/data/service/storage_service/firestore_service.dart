import 'package:todo_meb/data/models/task_model.dart';

abstract class FirestoreService {
  Stream<List<Task>> fetchTasks();

  Future<void> addTask(Task task);

  Future<void> updateTask(Task task);

  Future<void> deleteTask(String taskId);
}
