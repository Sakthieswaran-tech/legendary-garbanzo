import 'dart:convert';

import 'package:ecommproject/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void httpErrorHandle(
    {required Response response,
    required VoidCallback onSuccess,
    required BuildContext context}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(
          buildContext: context, text: jsonDecode(response.body)['message']);
      break;
    case 401:
      showSnackBar(
          buildContext: context, text: jsonDecode(response.body)['message']);
      break;
    case 500:
      showSnackBar(
          buildContext: context, text: jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(buildContext: context, text: response.body);
  }
}
