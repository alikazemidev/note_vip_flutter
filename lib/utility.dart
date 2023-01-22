import 'package:note_application_expert_flutter/task_enum.dart';
import 'package:note_application_expert_flutter/task_type.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> list = [
    TaskType(
      image: 'images/hard_working.png',
      title: 'کار زیاد',
      taskTypeEnum: TaskTypeEnum.working,
    ),
    TaskType(
      image: 'images/social_frends.png',
      title: 'قرار اجتماعی',
      taskTypeEnum: TaskTypeEnum.date,
    ),
    TaskType(
      image: 'images/meditate.png',
      title: 'تمرکز',
      taskTypeEnum: TaskTypeEnum.focus,
    ),
  ];

  return list;
}
