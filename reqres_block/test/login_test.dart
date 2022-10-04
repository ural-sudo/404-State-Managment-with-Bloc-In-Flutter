

import 'package:flutter_test/flutter_test.dart';
import 'package:reqres_block/view/auth/login/model/login_model.dart';
import 'package:reqres_block/view/auth/login/service/login_service.dart';

void main() {
  late  LoginService service;
  setUp(() {
    service = LoginService();
  },);
  test("Login Test for # eve.holt@reqres.in - cityslicka ", ()async{
    
    final response = await  service.login(LoginModel(email: 'eve.holt@reqres.in', password: 'cityslicka'));
    expect(response.token, isNotNull);
  },);
}