import 'package:hive_flutter/adapters.dart';
part 'task.g.dart';

@HiveType(typeId: 5)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  bool isDone;
  
  @HiveField(3)
  DateTime time;

  Task({
    required this.title,
    required this.subTitle,
    this.isDone = false,
    required this.time,
  });
}
