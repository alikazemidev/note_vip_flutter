import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application_expert_flutter/add_task_screen.dart';
import 'package:note_application_expert_flutter/task.dart';
// import 'package:note_application_expert_flutter/user.dart';
import 'home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SM'),
      debugShowCheckedModeBanner: false,
      home: AddTaskScreen(),
    );
  }
}
