import 'dart:convert';
import 'package:ctracker/constants/config.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/snack_bar.dart';

class LoginController {
  final storage = const FlutterSecureStorage();

  Future<String> _attemptLogIn(String email, String password) async {
    var res =
        await http.post(Uri.parse("${Config.apiBaseUrl}/v1/sessions/password"),
            headers: {"Content-Type": "application/json"},
            body: json.encode({
              "email": email,
              "password": password,
            }));

    if (kDebugMode) print(res.statusCode);

    if (res.statusCode == 200) {
      return json.decode(res.body)["token"];
    }
    throw Exception('Request failed with status: ${res.statusCode}');
  }

  submitLogin(BuildContext context, TextEditingController emailInputController,
      TextEditingController passwordInputController) async {
    var email = emailInputController.text;
    var password = passwordInputController.text;

    try {
      var jwt = await _attemptLogIn(email, password);

      storage.write(key: "jwt", value: jwt);

      if (kDebugMode) print("JWT: $jwt");

      if (!context.mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ViewHome()));
    } catch (error) {
      snackBar(context, "Email ou Senha incorretos");
    }
  }

  pushSignup(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const ViewSignup()));
  }
}
