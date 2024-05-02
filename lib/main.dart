import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: verifyJwt(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.white));
          if (snapshot.data != "") {
            var str = snapshot.data;
            var jwt = str!.split(".");

            if (jwt.length != 3) {
              return ViewLogin();
            } else {
              return const ViewHome();
            }
          } else {
            return ViewLogin();
          }
        }, 
      );
  }
}