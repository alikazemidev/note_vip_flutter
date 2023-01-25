import 'package:hive_flutter/adapters.dart';
import 'package:note_application_expert_flutter/task_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 6)
class TaskType extends HiveObject {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String title;

  @HiveField(2)
  final TaskTypeEnum taskTypeEnum;

  TaskType({
    required this.image,
    required this.title,
    required this.taskTypeEnum,
  });
}
