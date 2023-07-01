import 'package:ecommproject/constants/error_handling.dart';
import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/constants/utils.dart';
import 'package:ecommproject/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          id: '',
          token: '');
      http.Response response = await http.post(
          Uri.parse('$uri/users/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: response,
          onSuccess: () {
            showSnackBar(
              buildContext: context,
              text: 'Account created! Login with the same credentials!',
            );
          },
          context: context);
    } catch (e) {
      showSnackBar(buildContext: context, text: e.toString());
    }
  }
}
