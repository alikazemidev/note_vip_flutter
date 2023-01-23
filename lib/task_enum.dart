import 'package:hive_flutter/adapters.dart';
// Todo uncomment this and run command
// part 'task_enum.g.dart';

@HiveType(typeId: 7)
enum TaskTypeEnum {
  @HiveField(0)
  working,
  @HiveField(1)
  @HiveField(2)
  date,
  focus,
}
