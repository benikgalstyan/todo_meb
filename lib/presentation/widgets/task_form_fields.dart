import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/presentation/providers/task_form_provider.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';
import 'package:todo_meb/presentation/widgets/date_field_widget.dart';
import 'package:todo_meb/presentation/widgets/type_button_widget.dart';
import 'package:todo_meb/presentation/widgets/urgent_task_field.dart';

class TaskFormFields extends StatelessWidget {
  const TaskFormFields({
    required this.titleController,
    super.key,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    final formProvider = context.watch<TaskFormProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypeButtonWidget(
          selectedFilter: formProvider.taskType,
          onFilterChanged: formProvider.setTaskType,
        ),
        Spacings.spacer8,
        CompletionDateWidget(
          initialDate: formProvider.formattedDate,
          onDateChanged: formProvider.setTaskDate,
        ),
        Spacings.spacer8,
        UrgentTaskWidget(
          isUrgent: formProvider.isUrgent,
          onUrgentChanged: (urgentIndex) =>
              formProvider.setTaskUrgency(urgentIndex == 1),
        ),
        Spacings.spacer24,
      ],
    );
  }
}
