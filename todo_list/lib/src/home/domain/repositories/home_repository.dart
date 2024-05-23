import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';

import '../../../../core/utils/typedef.dart';
import '../entities/tasks_entity.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<List<TasksEntity>> getTasks();
  ResultVoid addTasks(AddTasksParam addTasksParam);
  ResultVoid deleteTasks(int idTasks);
  ResultVoid updateTasks(UpdateTasksParams updateTasksParams);
}
