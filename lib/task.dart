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

  Task({
    required this.title,
    required this.subTitle,
    this.isDone = false,
  });
}
