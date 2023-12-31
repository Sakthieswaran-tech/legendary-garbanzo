import 'dart:convert';

import 'package:ecommproject/constants/error_handling.dart';
import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/constants/utils.dart';
import 'package:ecommproject/models/user_model.dart';
import 'package:ecommproject/providers/user_provider.dart';
import 'package:ecommproject/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void signInUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(
          name: '',
          email: email,
          password: password,
          address: '',
          type: '',
          id: '',
          token: '');
      http.Response response = await http.post(
          Uri.parse('$uri/users/api/signin'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      httpErrorHandle(
          response: response,
          onSuccess: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            await sharedPreferences.setString(
                'auth-token', jsonDecode(response.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routename, (route) => false);
          },
          context: context);
    } catch (e) {
      showSnackBar(buildContext: context, text: e.toString());
    }
  }

  void validateToken({required BuildContext context}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('auth-token');
      if (token == null) {
        token = '';
      }
      http.Response tokenResponse = await http.get(
          Uri.parse('$uri/users/api/tokenCheck'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          });
      final response = jsonDecode(tokenResponse.body);
      if (response['valid']) {
        http.Response userData = await http.get(
            Uri.parse('$uri/users/api/user-data'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer $token'
            });
        var user = Provider.of<UserProvider>(context, listen: false);
        user.setUser(userData.body);
      }
    } catch (e) {
      showSnackBar(buildContext: context, text: e.toString());
    }
  }
}
