import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:ctracker/view/view_home.dart';
import 'package:ctracker/view/view_login.dart';
import 'package:ctracker/view/view_welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: const Root(),
    theme: ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      hintColor: AppColor.primaryColor,
    ),
  ));
}

class Root extends StatelessWidget {
  const Root({super.key});

  Future<bool> _isWelcomeScreenSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('welcome_screen_seen') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isWelcomeScreenSeen(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }

        if (snapshot.data == true) {
          return const Main();
        } else {
          return const ViewWelcome();
        }
      },
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  Future<bool> _isLoggedIn() async {
    final token = await verifyJwt();
    if (token.isEmpty) return false;
    final jwt = token.split(".");
    return jwt.length == 3;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        }

        if (snapshot.data == true) {
          return const ViewHome();
        } else {
          return const ViewLogin();
        }
      },
    );
  }
}
