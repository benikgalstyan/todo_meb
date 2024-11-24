import 'package:flutter/material.dart';
import 'package:todo_meb/data/models/task_model.dart';
import 'package:todo_meb/presentation/pages/main_screen/main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:todo_meb/presentation/pages/task_manage_screen/task_manage_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: MainScreen.nameRoute,
          initial: true,
        ),
        AutoRoute(page: TaskManageRoute.page, path: TaskManageScreen.nameRoute),
      ];
}
