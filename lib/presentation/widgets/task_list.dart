import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/core/theme/palette.dart';
import 'package:todo_meb/core/theme/text_styles.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/presentation/providers/task_list_provider.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.tasks});

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    final List<Task> pendingTasks =
        tasks.where((task) => task.status == 1).toList();
    final List<Task> completedTasks =
        tasks.where((task) => task.status == 2).toList();

    final hasNoTasks = pendingTasks.isEmpty && completedTasks.isEmpty;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasNoTasks) _buildEmptySection(context.s.noTasksAvailable),
            if (pendingTasks.isNotEmpty)
              _buildTaskSection(
                context,
                pendingTasks,
                true,
                context.s.pendingTasks,
              ),
            if (pendingTasks.isEmpty && !hasNoTasks)
              _buildEmptySection(context.s.noPendingTasks),
            if (completedTasks.isNotEmpty)
              _buildTaskSection(
                context,
                completedTasks,
                false,
                context.s.completed,
              ),
            if (completedTasks.isEmpty && !hasNoTasks)
              _buildEmptySection(context.s.noCompletedTasks),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskSection(
    BuildContext context,
    List<Task> tasks,
    bool isPending,
    String title,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: Spacings.paddingH8,
          child: Text(
            title,
            style: TextStyles.sectionTitleStyle,
          ),
        ),
        _buildTaskList(tasks, isPending, context),
      ],
    );
  }

  Widget _buildTaskList(
    List<Task> tasks,
    bool isPending,
    BuildContext context,
  ) =>
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Padding(
            padding: Spacings.paddingV8,
            child: _buildTaskItem(task, isPending, context),
          );
        },
      );

  Widget _buildTaskItem(Task task, bool isPending, BuildContext context) =>
      Dismissible(
        direction: DismissDirection.startToEnd,
        key: ValueKey(task.taskId),
        onDismissed: (direction) {
          context.read<TaskListProvider>().deleteTask(task.taskId!);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.s.taskDeleted),
              duration: const Duration(seconds: 2),
            ),
          );
        },
        background: _buildDismissBackground(),
        child: GestureDetector(
          child: _buildTaskContainer(task, isPending, context),
        ),
      );

  Widget _buildTaskContainer(Task task, bool isPending, BuildContext context) =>
      Container(
        padding: Spacings.padding8,
        decoration: BoxDecoration(
          color: _getBackgroundColor(task),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              size: 30.0,
              _getTaskStartIcon(task),
              color: Palette.textColor,
            ),
            Spacings.spacer12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.name, style: TextStyles.taskNameStyle),
                  Spacings.spacer4,
                  Text(
                    task.finishDate,
                    style: TextStyles.dateStyle,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _toggleTaskStatus(task, isPending, context),
              icon: Icon(
                size: 35.0,
                _getTaskEndIcon(task),
                color: Palette.textColor,
              ),
            ),
          ],
        ),
      );

  Widget _buildDismissBackground() => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.centerLeft,
        padding: Spacings.padding8,
        child: const Icon(Icons.delete, color: Colors.white),
      );

  Widget _buildEmptySection(String message) => Padding(
        padding: Spacings.paddingH8,
        child: Center(
          child: Text(
            message,
            style: TextStyles.emptyStateTextStyle,
          ),
        ),
      );

  IconData _getTaskEndIcon(Task task) =>
      task.status == 1 ? Icons.check_box_outline_blank : Icons.check_box;

  IconData _getTaskStartIcon(Task task) =>
      task.type == 1 ? Icons.work_outline : Icons.home_outlined;

  Color _getBackgroundColor(Task task) =>
      task.urgent == 1 ? Palette.urgentColor : Palette.defaultContainerColor;

  void _toggleTaskStatus(Task task, bool isPending, BuildContext context) {
    final taskProvider = context.read<TaskListProvider>();
    task.status = isPending ? 2 : 1;
    taskProvider.updateTask(task);
  }
}
