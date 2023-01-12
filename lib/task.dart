import 'package:hive_flutter/adapters.dart';
part 'task.g.dart';


@HiveType(typeId: 5)
class Task extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subTitle;

  Task({
    required this.title,
    required this.subTitle,
  });
}
