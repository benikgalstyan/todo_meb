import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/core/context_extensions.dart';
import 'package:todo_meb/core/router/router.dart';
import 'package:todo_meb/core/theme/palette.dart';
import 'package:todo_meb/presentation/providers/task_list_provider.dart';
import 'package:todo_meb/presentation/tokens/spacing.dart';
import 'package:todo_meb/presentation/widgets/app_wrapper.dart';
import 'package:todo_meb/presentation/widgets/filter_buttons.dart';
import 'package:todo_meb/presentation/widgets/task_list.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedFilter = 0;
  static const _addIcon = Icon(Icons.add, color: Colors.black, size: 33);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<TaskListProvider>().fetchTasks(),
    );
  }

  void _navigateToTaskEditor() => context.r.push(const TaskManageRoute());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppWrapper(
          child: Column(
            children: [
              FilterButtons(
                selectedFilter: selectedFilter,
                onFilterChanged: (newIndex) =>
                    setState(() => selectedFilter = newIndex),
              ),
              Spacings.spacer24,
              TaskList(
                tasks: context
                    .watch<TaskListProvider>()
                    .getFilteredTasks(selectedFilter),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.primaryButtonColor,
          onPressed: _navigateToTaskEditor,
          child: _addIcon,
        ),
      );
}
