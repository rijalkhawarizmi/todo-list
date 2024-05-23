import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/src/home/presentation/cubit/add_tasks/add_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/update_tasks/update_tasks_cubit.dart';
import 'core/route/routes.dart';
import 'core/services/injection_container.dart';
import 'src/authentication/presentation/bloc/authentication_bloc.dart';
import 'src/home/presentation/cubit/delete_tasks/delete_tasks_cubit.dart';
import 'src/home/presentation/cubit/get_tasks/get_tasks_cubit.dart';
import 'src/main/cubit/main_cubit.dart';

Future<void> main() async {
  init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sls<MainCubit>(),
          ),
          BlocProvider(
            create: (context) => sls<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (context) => sls<GetTasksCubit>(),
          ),
            BlocProvider(
            create: (context) => sls<AddTasksCubit>(),
          ),
           BlocProvider(
            create: (context) => sls<DeleteTasksCubit>(),
          ),
          BlocProvider(
            create: (context) => sls<UpdateTasksCubit>(),
          ),
          
        ],
        child: MaterialApp.router(
          routerConfig: routerApp,
          theme: ThemeData(
              fontFamily: GoogleFonts.roboto().fontFamily,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          debugShowCheckedModeBanner: false,
        ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:animated_tree_view/animated_tree_view.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Data TreeView Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'User Data TreeView Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final globalKey = GlobalKey<ScaffoldState>();
//   final AutoScrollController scrollController = AutoScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: globalKey,
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: CustomScrollView(
//         controller: scrollController,
//         slivers: [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 24.0),
//               child: Text(
//                 "Typed Sliver List",
//                 style: Theme.of(context).textTheme.headlineLarge,
//               ),
//             ),
//           ),
//           SliverTreeView.simpleTyped<TreeData, TreeNode<TreeData>>(
//             tree: userTree,
//             builder: (context, node) {
//               if (node.data?.isUserModel == true) {
//                 final userModel = node.data!.userModel!;
//                 return Card(
//                   child: ListTile(
//                     title: Text("User Name: ${userModel.name}"),
//                     subtitle: Text("Sub Users: ${userModel.userData.length}"),
//                   ),
//                 );
//               } else if (node.data?.isUserData == true) {
//                 final userData = node.data!.userData!;
//                 return Card(
//                   child: ListTile(
//                     title: Text("User Email: ${userData.email}"),
//                     subtitle: Text("User Age: ${userData.age}"),
//                   ),
//                 );
//               }
//               return SizedBox();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class UserModel {
//   final String name;
//   final List<UserData> userData;

//   UserModel({required this.name, required this.userData});
// }

// class UserData {
//   final String email;
//   final int age;

//   UserData({required this.email, required this.age});
// }

// class TreeData {
//   final UserModel? userModel;
//   final UserData? userData;

//   TreeData({this.userModel, this.userData});

//   bool get isUserModel => userModel != null;
//   bool get isUserData => userData != null;
// }

// final userTree = TreeNode<TreeData>.root(data: TreeData(userModel: UserModel(name: "User", userData: [])))
//   ..addAll([
//     TreeNode<TreeData>(
//       key: "0A",
//       data: TreeData(userModel: UserModel(
//         name: "Sr. John Doe",
//         userData: [
//           UserData(email: "sr.john@example.com", age: 50),
//           UserData(email: "jr.john@example.com", age: 25),
//         ],
//       )),
//     )..addAll([
//         TreeNode<TreeData>(
//           key: "0A1A",
//           data: TreeData(userData: UserData(email: "jr.john@example.com", age: 25)),
//         ),
//       ]),
//     TreeNode<TreeData>(
//       key: "0C",
//       data: TreeData(userModel: UserModel(
//         name: "General Lee",
//         userData: [
//           UserData(email: "general.lee@example.com", age: 60),
//           UserData(email: "major.lee@example.com", age: 30),
//           UserData(email: "happy.lee@example.com", age: 20),
//         ],
//       )),
//     )..addAll([
//         TreeNode<TreeData>(
//           key: "0C1A",
//           data: TreeData(userData: UserData(email: "major.lee@example.com", age: 30)),
//         ),
//         TreeNode<TreeData>(
//           key: "0C1B",
//           data: TreeData(userData: UserData(email: "happy.lee@example.com", age: 20)),
//         ),
//         TreeNode<TreeData>(
//           key: "0C1C",
//           data: TreeData(userData: UserData(email: "busy.lee@example.com", age: 35)),
//         )..addAll([
//             TreeNode<TreeData>(
//               key: "0C1C2A",
//               data: TreeData(userData: UserData(email: "jr.busy@example.com", age: 15)),
//             ),
//           ]),
//       ]),
//     TreeNode<TreeData>(
//       key: "0D",
//       data: TreeData(userModel: UserModel(
//         name: "Mr. Anderson",
//         userData: [
//           UserData(email: "neo@example.com", age: 40),
//         ],
//       )),
//     ),
//     TreeNode<TreeData>(
//       key: "0E",
//       data: TreeData(userModel: UserModel(
//         name: "Mr. Smith",
//         userData: [
//           UserData(email: "agent.smith@example.com", age: 45),
//         ],
//       )),
//     ),
//   ]);

