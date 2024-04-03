import 'dart:html';

import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override 
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin>{
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey <FormState>();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            key: _formKey,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,  
              children: <Widget>[
                Text("Logar-se no Champions Tracker",
                style: TextStyle(fontSize: 24.0, 
                fontWeight: FontWeight.bold, 
                color: AppColor.textColor),
                ),
                buildTextField("Email", emailInputController),
                const Divider(),
                buildTextField("senha", passwordInputController),
              ],
            ),
          ),
      ),
    );
  }

}
