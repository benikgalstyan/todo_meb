import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/core/theme/palette.dart';
import 'package:todo_meb/core/theme/text_styles.dart';
import 'package:todo_meb/presentation/providers/task_form_provider.dart';

class TaskManageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManageAppBar({
    super.key,
    required this.titleController,
    required this.titleFocusNode,
  });

  final FocusNode titleFocusNode;
  final TextEditingController titleController;

  static const arrowBackIcon = Icon(
    Icons.arrow_back,
    color: Palette.primaryButtonColor,
  );
  static const acceptIcon = Icon(
    Icons.check,
    color: Palette.primaryButtonColor,
  );

  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<TaskFormProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Palette.backgroundColor,
        leading: IconButton(
          icon: arrowBackIcon,
          onPressed: () {
            formProvider.resetForm();
            context.r.maybePop();
          },
        ),
        title: TextField(
          controller: titleController,
          focusNode: titleFocusNode,
          style: TextStyles.textFieldStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: titleFocusNode.hasFocus ? '' : context.s.nameOfTask,
            hintStyle: TextStyles.hintTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
