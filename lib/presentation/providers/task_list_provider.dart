import 'package:flutter/material.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/data/service/storage_service/firestore_service.dart';

class TaskListProvider extends ChangeNotifier {
  TaskListProvider(this.firestoreService);

  final FirestoreService firestoreService;
  Task? task;

  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  List<Task> getFilteredTasks(int filterType) {
    if (filterType == 1) return _tasks.where((task) => task.type == 1).toList();
    if (filterType == 2) return _tasks.where((task) => task.type == 2).toList();
    return _tasks;
  }

  void fetchTasks() => firestoreService.fetchTasks().listen((taskList) {
        _tasks = taskList;
        notifyListeners();
      });

  Future<void> addTask(Task task) async => await firestoreService.addTask(task);

  Future<void> updateTask(Task task) async =>
      await firestoreService.updateTask(task);

  Future<void> deleteTask(String taskId) async =>
      await firestoreService.deleteTask(taskId);
}
