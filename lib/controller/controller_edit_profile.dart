import 'dart:convert';

import 'package:ctracker/constants/config.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:ctracker/utils/snack_bar.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EditProfileController {
  final storage = const FlutterSecureStorage();

  Future<User> fetchInfo() async {
    var jwt = await verifyJwt();

    // Fetch profile data from API
    var res =
        await http.get(Uri.parse("${Config.apiBaseUrl}/v1/profile"), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer $jwt"
    });

    if (res.statusCode == 200) {
      if (kDebugMode) print("Response: ${res.body}");
      return User.fromJson(json.decode(res.body) as Map<String, dynamic>);
    } else {
      throw Exception("Request failed with status: ${res.statusCode}");
    }
  }

  Future<http.Response> _attemptUpdateProfile(
      User userModel, String password) async {
    var jwt = await verifyJwt();

    final res = await http.patch(Uri.parse("${Config.apiBaseUrl}/v1/users"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "Authorization": "Bearer $jwt"
        },
        body: json.encode({"data": userModel.toJson(), "password": password}));

    return res;
  }

  Future<http.Response> _attemptUpdatePassword(
      String oldPassword, String newPassword) async {
    var jwt = await verifyJwt();

    final res =
        await http.put(Uri.parse("${Config.apiBaseUrl}/v1/password/change"),
            headers: {
              "Content-Type": "application/json",
              'Accept': 'application/json',
              'Authorization': 'Bearer $jwt',
            },
            body: json.encode({
              "password": oldPassword,
              "newPassword": newPassword,
            }));

    return res;
  }

  updateProfile(
    BuildContext context,
    TextEditingController nameInputController,
    TextEditingController nicknameInputController,
    TextEditingController emailInputController,
    TextEditingController passwordInputController,
  ) async {
    var name = nameInputController.text;
    var nickname = nicknameInputController.text;
    var email = emailInputController.text;
    var password = passwordInputController.text;

    User user = User(name: name, nickname: nickname, email: email);

    var res = await _attemptUpdateProfile(user, password);

    if (kDebugMode) {
      print('[!] Status Code: ${res.statusCode}');
    }
    if (res.statusCode == 200) {
      if (!context.mounted) return;
      snackBar(context, "Perfil atualizado com sucesso");
      Navigator.pop(context);
    } else if (res.statusCode == 401) {
      if (!context.mounted) return;
      snackBar(context, "Senha incorreta");
    } else if (res.statusCode == 409) {
      if (!context.mounted) return;
      snackBar(context, "Apelido ou email já em uso");
    } else {
      if (!context.mounted) return;
      snackBar(context, "Erro ao atualizar perfil");
    }
  }

  updatePassword(
      BuildContext context,
      TextEditingController oldPasswordInputController,
      TextEditingController newPasswordInputController,
      TextEditingController confirmNewPasswordInputController) async {
    var oldPassword = oldPasswordInputController.text;
    var newPassword = newPasswordInputController.text;
    var confirmNewPassword = confirmNewPasswordInputController.text;

    if (newPassword != confirmNewPassword) {
      snackBar(context, "As senhas não coincidem");
      return;
    }

    var res = await _attemptUpdatePassword(oldPassword, newPassword);

    if (kDebugMode) {
      print('[!] Status Code: ${res.statusCode}');
    }

    if (res.statusCode == 204) {
      if (!context.mounted) return;
      snackBar(context, "Senha atualizada com sucesso");
      Navigator.pop(context);
    } else {
      if (!context.mounted) return;
      snackBar(context, "Senha incorreta");
    }
  }
}
