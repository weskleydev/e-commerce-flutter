import 'package:ecommerce_model/app/modules/authentication/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Messages {
  static error(String title, String message) {
    return Get.defaultDialog(title: title, content: Text(message));
  }

  static welcome(User user) {
    return Get.snackbar('Olá ${user.name}', 'Seja Bem Vindo!',
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        icon: Icon(Icons.sentiment_very_satisfied));
  }
}
