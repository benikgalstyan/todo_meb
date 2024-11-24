import 'package:flutter/material.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';
import 'package:todo_meb/presentation/widgets/custom_button.dart';

class TaskActionButtons extends StatelessWidget {
  const TaskActionButtons({
    super.key,
    required this.isEditing,
    required this.isFormValid,
    required this.onCreateOrUpdate,
    required this.onDelete,
  });

  final bool isEditing;
  final bool isFormValid;
  final VoidCallback onCreateOrUpdate;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Spacings.paddingH16,
        child: isEditing
            ? TODOElevatedButton.delete(
                text: context.s.delete,
                isEnabled: true,
                onPressed: onDelete,
              )
            : TODOElevatedButton.primary(
                text: context.s.create,
                isEnabled: isFormValid,
                onPressed: onCreateOrUpdate,
              ),
      );
}
