import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/core/theme/palette.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/presentation/providers/task_form_provider.dart';
import 'package:todo_meb/presentation/providers/task_list_provider.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';
import 'package:todo_meb/presentation/widgets/task_action_button.dart';
import 'package:todo_meb/presentation/widgets/task_form_fields.dart';
import 'package:todo_meb/presentation/widgets/task_manager_app_bar.dart';

class TaskManageLayout extends StatefulWidget {
  const TaskManageLayout({super.key});

  @override
  State<TaskManageLayout> createState() => _TaskManageLayoutState();
}

class _TaskManageLayoutState extends State<TaskManageLayout> {
  final _titleFocusNode = FocusNode();
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeForm(context.read<TaskListProvider>().task);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: TaskManageAppBar(
            titleFocusNode: _titleFocusNode,
            titleController: _titleController,
          ),
          backgroundColor: Palette.backgroundColor,
          body: Consumer<TaskFormProvider>(
            builder: (context, formProvider, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacings.spacer24,
                TaskFormFields(titleController: _titleController),
                TaskActionButtons(
                  onDelete: () => _handleTaskAction(isDelete: true),
                  isEditing: context.read<TaskListProvider>().task != null,
                  onCreateOrUpdate: () => _handleTaskAction(isDelete: false),
                  isFormValid: formProvider.isFormValid(_titleController.text),
                ),
                Spacings.spacer24,
              ],
            ),
          ),
        ),
      );

  void _initializeForm(Task? task) {
    final formProvider = context.read<TaskFormProvider>();
    if (task != null) {
      formProvider.setTaskType(task.type);
      formProvider.setTaskDate(task.finishDate);
      formProvider.setTaskUrgency(task.urgent == 1);
    }
  }

  void _handleTaskAction({required bool isDelete}) {
    final formProvider = context.read<TaskFormProvider>();
    final taskProvider = context.read<TaskListProvider>();

    if (isDelete) {
      if (taskProvider.task != null) {
        taskProvider.deleteTask(taskProvider.task!.taskId!);
      }
    } else {
      final newTask = Task(
        status: formProvider.status,
        name: _titleController.text,
        type: formProvider.taskType,
        urgent: formProvider.isUrgent ? 1 : 0,
        finishDate: formProvider.formattedDate!,
      );

      if (taskProvider.task == null) {
        taskProvider.addTask(newTask);
      } else {
        newTask.taskId = taskProvider.task!.taskId;
        taskProvider.updateTask(newTask);
      }
    }

    formProvider.resetForm();
    context.r.maybePop();
  }
}
