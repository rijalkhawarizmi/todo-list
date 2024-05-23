import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/presentation/views/home_page.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/custom_text.dart';
import '../../../../common/widgets/text_field.dart';
import '../../../../core/style/color_app.dart';
import '../../../authentication/presentation/bloc/authentication_bloc.dart';
import '../../../authentication/presentation/widget/toast_widget.dart';

class LoginPage extends StatelessWidget {
  static const String loginRoute = 'login-route';
  LoginPage({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomTextNunito(
              text: 'Masuk',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorApp.black600),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: CustomTextNunito(
                        text: 'Email',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.black,
                      ),
                    ),
                    CustomTextRobotoField(
                      controller: email,
                      hintText: 'masukkan email/username  kamu',
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: CustomTextNunito(
                        text: 'Kata Sandi',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.black,
                      ),
                    ),
                    Builder(builder: (context) {
                      final state = context.watch<AuthenticationBloc>().state;
                      return CustomTextRobotoField(
                        obscureText: state is ObscurePassword
                            ? state.obscurePass
                                ? false
                                : true
                            : true,
                        controller: password,
                        hintText: 'masukkan kata sandi kamu',
                        suffixIcon: InkWell(
                            onTap: () {
                              state is ObscurePassword
                                  ? state.obscurePass
                                      ? context.read<AuthenticationBloc>().add(
                                          EventObscurePassword(
                                              obscurePassword: false))
                                      : context.read<AuthenticationBloc>().add(
                                          EventObscurePassword(
                                              obscurePassword: true))
                                  : context.read<AuthenticationBloc>().add(
                                      EventObscurePassword(
                                          obscurePassword: true));
                            },
                            child: state is ObscurePassword
                                ? state.obscurePass
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.visibility_off_sharp)
                                : Icon(Icons.visibility_off_sharp)),
                      );
                    }),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomTextNunito(
                        text: 'Lupa kata sandi?',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.red),
                  ),
                ),
                BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationSuccess) {
                      context.goNamed(HomePage.homeRoute);
                    } else if (state is AuthenticationError) {
                      toastWidget(state.message);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return CustomButton(
                      onPressed: () {
                        if (email.text.isEmpty) {
                          toastWidget('Masukkan Email');
                        } else if (password.text.isEmpty) {
                          toastWidget('Masukkan Password');
                        } else {
                          context.read<AuthenticationBloc>().add(
                              EventAuthentication(
                                  email: email.text, password: password.text));
                        }
                      },
                      borderRadius: 4,
                      isLoading: state is AuthenticationLoading ? true : false,
                      text: 'Masuk',
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
