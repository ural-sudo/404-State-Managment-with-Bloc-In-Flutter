import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_block/view/auth/login/view/login_view.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit.dart';

void main() {
  runApp( MultiBlocProvider(
    providers: [
      BlocProvider<LoginCubit>(create: (context) {
        return LoginCubit(); 
      }),
    ],
    child:const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    );
  }
}


