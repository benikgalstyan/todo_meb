import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_meb/data/service/storage_service/firestore_service.dart';
import 'package:todo_meb/firebase_options.dart';
import 'package:todo_meb/presentation/providers/task_form_provider.dart';
import 'package:todo_meb/presentation/providers/task_list_provider.dart';
import 'package:todo_meb/todo_meb_app.dart';
import 'package:todo_meb/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TaskFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TaskListProvider(getIt<FirestoreService>()),
        ),
      ],
      child: TodoMebApp(),
    ),
  );
}
