import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/presentation/pages/task_manage_screen/task_manage_layout.dart';

@RoutePage()
class TaskManageScreen extends StatelessWidget {
  const TaskManageScreen({super.key});

  static const nameRoute = '/TaskManageScreen';

  @override
  Widget build(BuildContext context) {
    return const TaskManageLayout();
  }
}
