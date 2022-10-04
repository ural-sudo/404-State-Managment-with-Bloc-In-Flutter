

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reqres_block/view/auth/login/model/login_model.dart';
import 'package:reqres_block/view/auth/login/service/login_service.dart';
import 'package:reqres_block/view/auth/login/viewModel/login_cubit_state.dart';


class LoginCubit extends Cubit<LoginState>{
  LoginCubit(): super(LoginState());

  final LoginService service = LoginService();

  void trueValid (){
    emit(LoginState(isValid: true));
  }
  void falseValid (){
    emit(LoginState(isValid: false));
  }
  

  Future<void> userControl (String username, String password) async {
    emit(LoginState(isLoading: true));
    final response = await service.login(LoginModel(email: username, password: password));
    emit(LoginState(isLoading: false,isComplated: response.token != null));
  }

  
}