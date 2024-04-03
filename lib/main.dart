import 'package:ctracker/view/view_login.dart';
import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';

void main() async {
    runApp(MaterialApp(
        home: const Main(),
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.backgroundColor
        )
    ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
        body: ViewLogin(),
    );
  }
}