import 'package:flutter/material.dart';

void showSnackBar({required BuildContext buildContext, required String text}) {
  ScaffoldMessenger.of(buildContext)
      .showSnackBar(SnackBar(content: Text(text)));
}
