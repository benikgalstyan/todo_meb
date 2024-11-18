import 'package:todo_meb/core/logger/composite_logger_holder.dart';
import 'package:todo_meb/core/router/app_router_holder.dart';
import 'package:todo_meb/core/router/router.dart';
import 'package:todo_meb/generated/l10n.dart';
import 'package:todo_meb/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TodoMebApp extends StatelessWidget {
  TodoMebApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.dark(),
      routerConfig: _router.config(),
      builder: (context, router) {
        return AppRouterHolder(
          router: _router,
          child: CompositeLoggerHolder(
            compositeLogger: getLogger,
            child: router!,
          ),
        );
      },
    );
  }
}
