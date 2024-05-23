import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import 'package:todo_list/src/home/presentation/views/add_update_tasks_page.dart';
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
  ],
);
