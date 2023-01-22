import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_application_expert_flutter/task.dart';
import 'package:note_application_expert_flutter/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final taskBox = Hive.box<Task>('taskBox');
  DateTime? _time;

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //title textfield
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: titleController,
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban1.hasFocus
                            ? Color(0xff18daa3)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18daa3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // subtitle textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: subTitleController,
                    maxLines: 5,
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'توضیحات تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban1.hasFocus
                            ? Color(0xff18daa3)
                            : Color(0xffC5C5C5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18daa3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  elevation: 2,
                  title: 'زمانت رو انتخاب کن',
                  onNegativePressed: (context) {},
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                  negativeButtonText: 'حذفش کن',
                  positiveButtonText: 'انتخابش کن',
                  positiveButtonStyle: TextStyle(
                    color: Color(0xff18daa3),
                  ),
                  negativeButtonStyle: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TaskTypeItemList(),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff18daa3),
                  minimumSize: Size(200, 48),
                ),
                onPressed: () {
                  addTask();
                  Navigator.pop(context);
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addTask() {
    taskBox.add(
      Task(
          title: titleController.text,
          subTitle: subTitleController.text,
          time: _time!),
    );
  }
}

class TaskTypeItemList extends StatelessWidget {
  const TaskTypeItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getTaskTypeList().length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  getTaskTypeList()[index].image,
                ),
                Text(getTaskTypeList()[index].title),
              ],
            ),
          );
        },
      ),
    );
  }
}

extension on CustomHourPicker {}
