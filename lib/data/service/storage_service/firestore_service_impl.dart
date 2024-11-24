import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/data/service/storage_service/firestore_service.dart';

class FirestoreServiceImpl implements FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Task>> fetchTasks() {
    return _firestore.collection('tasks').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Task.fromMap(doc.data())).toList(),
        );
  }

  @override
  Future<void> addTask(Task task) async {
    final docRef = await _firestore.collection('tasks').add({
      ...task.toMap(),
      'taskId': '',
    });

    await docRef.update({'taskId': docRef.id});
  }

  @override
  Future<void> updateTask(Task task) async {
    await _firestore.collection('tasks').doc(task.taskId).update(task.toMap());
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }
}
