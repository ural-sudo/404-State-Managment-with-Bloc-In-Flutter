
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:reqres_block/product/model/token_model.dart';

import '../model/login_model.dart';

class LoginService {

  late final Dio dio;

  LoginService() {
    dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));
  }

  Future<TokenModel> login(LoginModel model) async {
    print("geldi");
    final response = await dio.post("/login",data: model);
    if(response.statusCode == HttpStatus.ok){
      print("this");
      final tokenData = response.data;
      if(tokenData is Map<String,dynamic>){
        print("burada");
        return TokenModel.fromJson(tokenData);
      }
    }
    return TokenModel();
  }
}