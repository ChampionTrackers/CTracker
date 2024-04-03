import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:flutter/material.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Logar-se no Champions Tracker",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor),
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              FormTextField(
                keyboardType: TextInputType.emailAddress,
                labelText: "Email",
                controller: emailInputController,
              ),
              const SizedBox(
                height: 20, // <-- SEE HERE
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Senha",
                controller: passwordInputController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
