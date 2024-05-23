import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import 'package:todo_list/src/home/presentation/views/add_update_tasks_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_assignment_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_board_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_child_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_metada_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_pivot_page.dart';
import 'package:todo_list/src/home/presentation/views/detail_task_page.dart';
import 'package:todo_list/src/home/presentation/views/home_page.dart';
import '../../src/authentication/presentation/views/login_page.dart';
import '../../src/main/main_page.dart';
final GoRouter routerApp = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: MainPage.mainRoute,
      builder: (BuildContext context, GoRouterState state) {
        return MainPage();
      },
    ),
    GoRoute(
      path: '/login-route',
      name: LoginPage.loginRoute,
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/home-route',
      name: HomePage.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
    GoRoute(
      path: '/addupdatetasks-route',
      name: AddUpdateTasksPage.addTasksRoute,
      builder: (BuildContext context, GoRouterState state) {
        return AddUpdateTasksPage(updateTasksParams: state.extra as UpdateTasksParams?);
      },
    ),
    GoRoute(
      path: '/detail-task-route',
      name: DetailTaskPage.detailTaskRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailTaskPage(tasksEntity: state.extra as TasksEntity?);
      },
    ),
    GoRoute(
      path: '/detail-board-route',
      name: DetailBoardPage.detailBoardRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailBoardPage(tasksEntity: state.extra as BoardEntity?);
      },
    ),
     GoRoute(
      path: '/detail-pivot-route',
      name: DetailPivotPage.detailPivotRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailPivotPage(pivotEntity: state.extra as PivotEntity?);
      },
    ),
     GoRoute(
      path: '/detail-metadata-route',
      name: DetailMetaDataPage.detailMetaDataRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailMetaDataPage(metadataEntity: state.extra as MetadataEntity?);
      },
    ),
     GoRoute(
      path: '/detail-assignment-route',
      name: DetailAssignmentPage.detailAssignmentRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailAssignmentPage(assignmentEntity: state.extra as AssignmentEntity?);
      },
    ),
     GoRoute(
      path: '/detail-child-route',
      name: DetailChildPage.detailChildRoute,
      builder: (BuildContext context, GoRouterState state) {
        return DetailChildPage(childEntity: state.extra as ChildEntity?);
      },
    ),
    
  ],
);
