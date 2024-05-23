import 'dart:math';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/tasks_entity.dart';
import '../../../domain/usecases/get_tasks.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit({
    required GetTasks getTasks,
  })  : _getTasks = getTasks,
        super(GetTasksInitial());

  final GetTasks _getTasks;

  void getListTasks() async {
    emit(GetTasksLoading());
    final result = await _getTasks();
    result
        .fold((failure) => emit(GetTasksFailed(message: failure.errorMessage)),
            (tasks) {
      final userTree = TreeNode<TreeData>.root(
          data: TreeData(tasksEntity: TasksEntity(title: "User", board: null)));

      if (tasks.isNotEmpty) {
        for (var data in tasks) {
          userTree.addAll([
            TreeNode<TreeData>(
              key: Random().nextInt(10000).toString(),
              data: TreeData(tasksEntity: data),
            )
              ..addAll([
                TreeNode<TreeData>(
                  key: Random().nextInt(100000).toString(),
                  data: TreeData(boardEntity: data.board),
                )
                  ..addAll([
                    TreeNode<TreeData>(
                      key: Random().nextInt(100000).toString(),
                      data: TreeData(metadataEntity: data.board?.metadata),
                    ),
                  ])
                  ..addAll([
                    TreeNode<TreeData>(
                      key: Random().nextInt(100000).toString(),
                      data: TreeData(pivotEntity: data.board?.pivot),
                    ),
                  ])
              ])
              ..addAll([
                TreeNode<TreeData>(
                  key: Random().nextInt(100000).toString(),
                  data: TreeData(
                      assignmentEntity: data.assignments
                          ?.map<AssignmentEntity>((e) => e)
                          .toList()),
                )
              ])
              ..addAll([
                TreeNode<TreeData>(
                  key: Random().nextInt(100000).toString(),
                  data: TreeData(
                      childEntity:
                          data.children?.map<ChildEntity>((e) => e).toList()),
                )
              ])
          ]);
        }
        emit(
        GetTasksSuccess(tasksEnity: tasks, treeNode: userTree),
      );
      } else {
        emit(const GetTasksEmpty(message: "Tasks belum ada"));
      }

      
    });
  }
}

class TreeData {
  final TasksEntity? tasksEntity;
  final List<AssignmentEntity>? assignmentEntity;
  final BoardEntity? boardEntity;
  final PivotEntity? pivotEntity;
  final MetadataEntity? metadataEntity;
  final List<ChildEntity>? childEntity;

  TreeData(
      {this.tasksEntity,
      this.assignmentEntity,
      this.boardEntity,
      this.pivotEntity,
      this.metadataEntity,
      this.childEntity});

  bool get isTaskEntity => tasksEntity != null;
  bool get isAssignmentEntity => assignmentEntity != null;
  bool get isBoardEntity => boardEntity != null;
  bool get isMetaDataEntity => metadataEntity != null;
  bool get isPivotEntity => pivotEntity != null;
  bool get isChildEntity => childEntity != null;
}
