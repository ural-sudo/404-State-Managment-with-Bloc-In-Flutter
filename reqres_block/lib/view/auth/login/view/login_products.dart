import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit_state.dart';
import 'package:reqres_block/view/home/homepage.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.usernameController,
    required this.passwordController,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {
          if(state.isComplated){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
          }
        },
        builder: (context, state) {
          return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () {
            if(_formKey.currentState?.validate() == false){
              context.read<LoginCubit>().falseValid();
            }else{
             context.read<LoginCubit>().trueValid();
              context.read<LoginCubit>().userControl(usernameController.text,passwordController.text);
            }
            
          },
        child: const Text("Login"),
              );
        }, 
      ),
    );
  }
}

class EmailAndPasswordTextField extends StatelessWidget {
  const EmailAndPasswordTextField({
    Key? key,
    required this.usernameController, required this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
     String username = "Username";
     String password ="Password";
    return BlocBuilder<LoginCubit,LoginState>(
      builder: (context, state) {
        return  AnimatedOpacity(
          duration: const Duration(milliseconds: 500) ,
          opacity: state.isLoading ? 0.3 : 1,
          child: Column(
          children: [
            Padding(
          padding:const EdgeInsets.only(top: 20.0,bottom: 20.0),
          child: FormField(
            controller: usernameController,
            text: username,isSecure: false,
            validate: (value){
              if((value?.length ?? 0) < 6){
                return "Problem";
              }
              return null; 
            },
          ),
              ),
              FormField(
          validate:(value){
            if((value?.length ?? 0) < 6){
              return "problem";
            }else{
              return null;
            }
          },
          controller: passwordController,
          text: password,isSecure: true,
              ),
          ],
              ),
        );
      },
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.controller,
    required this.text,
    required this.isSecure,
    required this.validate, 
    
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final bool isSecure;
  final String? Function(String? value)? validate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(
      builder: (context, state) {
        return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.0),
         border: Border.all(width: 1.0,color: state.isValid ? Colors.black : Colors.red),
       ),
       child: Padding(
         padding: const EdgeInsets.only(left: 10.0),
         child: TextFormField(
           
           validator:validate,
           controller: controller,
           obscureText: isSecure,
           obscuringCharacter: "*",
           decoration: InputDecoration(
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
             focusedBorder: InputBorder.none,
             hintText: text,
           ), 
         ),
       ),
      );
      },
    );
  }
}