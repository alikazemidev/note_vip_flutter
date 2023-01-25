import 'package:hive_flutter/adapters.dart';

part 'task_enum.g.dart';

@HiveType(typeId: 7)
enum TaskTypeEnum {
  @HiveField(0)
  working,

  @HiveField(1)
  date,
  
  @HiveField(2)
  focus,
}
