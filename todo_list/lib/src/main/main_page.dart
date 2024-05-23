import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/authentication/presentation/views/login_page.dart';
import 'package:todo_list/src/home/presentation/views/home_page.dart';
import 'package:todo_list/src/main/cubit/main_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const String mainRoute = "/";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocListener<MainCubit, MainState>(
            bloc: BlocProvider.of<MainCubit>(context)..checkData(),
            listener: (context, state) {
              if(state is MainDataNotEmpty){
                context.goNamed(HomePage.homeRoute);
              }else if (state is MainDataEmpty){
                context.goNamed(LoginPage.loginRoute);
              }
            },
            child: Container(color: Colors.transparent,),
          ),
        );
      },
    );
  }
}
