import 'dart:convert';

import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:ctracker/view/view_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  runApp(MaterialApp(
      home: const Main(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        hintColor: AppColor.primaryColor,
       
      )));
}

class Main extends StatelessWidget {
  const Main({super.key});

Future<String> get verifyJwt async {
  final storage = FlutterSecureStorage();
  var jwt = await storage.read(key: "jwt");
  if (jwt == null) return "";
  return jwt;
}
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: verifyJwt,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            var jwt = str!.split(".");

            if (jwt.length != 3) {
              return ViewLogin();
            } else {
              var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
              if (kDebugMode) print("Payload: $payload");

              return const ViewHome();
            }
          } else {
            return ViewLogin();
          }
        }, 
      );
  }
}