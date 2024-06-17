import 'dart:convert';
import 'package:ctracker/constants/config.dart';
import 'package:ctracker/utils/snack_bar.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupController {
  Future<int> _attemptSignUp(
      String email, String name, String username, String password) async {
    var res = await http.post(
        Uri.parse("${Config.apiBaseUrl}/v1/users"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
          "password": password,
          "name": name,
          "nickname": username,
          "picture": "https://api.dicebear.com/8.x/lorelei/png?seed=$username"
        }));

    return res.statusCode;
  }

  submitSignup(
      BuildContext context,
      TextEditingController nameInputController,
      TextEditingController usernameInputController,
      TextEditingController emailInputController,
      TextEditingController passwordInputController,
      TextEditingController confirmPasswordInputController,
      termsCheckbox) async {
    var name = nameInputController.text;
    var email = emailInputController.text;
    var username = usernameInputController.text;
    var password = passwordInputController.text;
    var confirmPassword = confirmPasswordInputController.text;

    if (password != confirmPassword) {
      snackBar(context, "Senhas não coincidem");
      return;
    }

    if (!termsCheckbox) {
      snackBar(context, "Você precisa aceitar os termos de uso");
      return;
    }

    var res = await _attemptSignUp(email, name, username, password);
    if (res == 201) {
      if (!context.mounted) return;
      snackBar(context, "Conta criada com sucesso");

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ViewLogin()));
    } else if (res == 409) {
      if (!context.mounted) return;
      snackBar(context, "Usuário já existe");
    } else {
      if (!context.mounted) return;
      snackBar(context, "Erro ao criar conta");
    }
  }

  pushLogin(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ViewLogin()));
  }
}
