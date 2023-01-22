import 'package:flutter/material.dart';
import 'package:note_application_expert_flutter/edit_task_screen.dart';
import 'package:note_application_expert_flutter/task.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  const TaskWidget({super.key, required this.task});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return taskItem();
  }

  Widget taskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: taskContent(),
        ),
      ),
    );
  }

  Widget taskContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckboxTheme(
                    data: CheckboxThemeData(
                      shape: CircleBorder(),
                      side: BorderSide(
                        width: 1,
                        color: Color(0xff18daa3),
                      ),
                      fillColor: MaterialStatePropertyAll(
                        Color(0xff18daa3),
                      ),
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: isBoxChecked,
                        onChanged: (value) {
                          // setState(() {
                          //   ischecked = value!;
                          // });
                        },
                      ),
                    ),
                  ),
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      decoration:
                          isBoxChecked ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
              Text(
                widget.task.subTitle.trim(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration: isBoxChecked ? TextDecoration.lineThrough : null,
                ),
              ),
              Spacer(),
              editAndTimeBadge(),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset(
          'images/hard_working.png',
        ),
      ],
    );
  }

  Widget editAndTimeBadge() {
    return Row(
      children: [
        Container(
          width: 87,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18daa3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text(
                  '${widget.task.time.hour}:${getMinutes(widget.task.time)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 87,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffe2f1f6),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Color(0xff18daa3),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getMinutes(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
