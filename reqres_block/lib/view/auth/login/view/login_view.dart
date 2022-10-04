
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_block/view/auth/login/view/login_products.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit_state.dart';
import 'package:reqres_block/view/home/homepage.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<LoginCubit,LoginState>(
          builder: (context, state) {
            return state.isLoading ? const CircularProgressIndicator(color: Colors.orange,) : SizedBox.shrink();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Form(
        key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailAndPasswordTextField(
            usernameController: usernameController,
            passwordController: passwordController,
          ),
          LoginButton(
              formKey: _formKey,
              usernameController: usernameController,
              passwordController: passwordController
          )
        ],
      ),
    ),
      ),
    );
  }
}

