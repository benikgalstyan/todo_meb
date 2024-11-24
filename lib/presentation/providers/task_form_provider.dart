import 'package:flutter/material.dart';

class TaskFormProvider extends ChangeNotifier {
  int taskType = 1;
  bool isUrgent = false;
  String? formattedDate;
  int status = 1;

  void setTaskType(int type) {
    taskType = type;
    notifyListeners();
  }

  void setTaskUrgency(bool urgent) {
    isUrgent = urgent;
    notifyListeners();
  }

  void setTaskDate(String? date) {
    formattedDate = date;
    notifyListeners();
  }

  void setTaskStatus(int newStatus) {
    status = newStatus;
    notifyListeners();
  }

  bool isFormValid(String title) => title.isNotEmpty && formattedDate != null;

  void resetForm() {
    taskType = 1;
    isUrgent = false;
    formattedDate = null;
    status = 1;
    notifyListeners();
  }
}
