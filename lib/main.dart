import 'package:firebase_core/firebase_core.dart';
import 'package:todo_meb/firebase_options.dart';
import 'package:todo_meb/todo_meb_app.dart';
import 'package:todo_meb/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServicesLocator();
  runApp(TodoMebApp());
}
