import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_application_expert_flutter/add_task_screen.dart';
import 'package:note_application_expert_flutter/task.dart';
import 'package:note_application_expert_flutter/task_widget.dart';

//Todo add msh checkbox
// import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskBox = Hive.box<Task>('taskBox');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          backgroundColor: Color(0xff18daa3),
          label: Row(
            children: [
              Text(
                'Add',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(Icons.add),
            ],
          ),
        ),
        backgroundColor: Color(0xffe5e5e5),
        appBar: AppBar(
          title: Text('home Page note app'),
        ),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: taskBox.listenable(),
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];
                  return TaskWidget(task: task);
                },
              ); 
            },
          ),
        ),
      ),
    );
  }
}
