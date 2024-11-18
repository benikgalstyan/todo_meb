import 'package:todo_meb/todo_meb_app.dart';
import 'package:todo_meb/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupServicesLocator();
  runApp(TodoMebApp());
}
