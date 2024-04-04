import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewSignin extends StatefulWidget {
  const ViewSignin({super.key});

  @override
  State<ViewSignin> createState() => _ViewSigninState();
}

class _ViewSigninState extends State<ViewSignin> {
  final usernameInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  final confirmPasswordInputController = TextEditingController();

  bool termsCheckbox = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validarForm() {
    if (_formKey.currentState!.validate()) {
      if (kDebugMode) {
        print("Formulário validado");
      }
    } else {
      if (kDebugMode) {
        print("Formulário inválido");
      }
    }
  }

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
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Cadastre-se no Champions Tracker",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor),
              ),
              // Row(
              //   children: <Widget>[
              //     Expanded(
              //       child: Container(
              //           margin: const EdgeInsets.only(right: 25.0),
              //           child: const Divider(
              //             color: AppColor.secondaryColor,
              //             height: 36,
              //           )),
              //     ),
              //     const Text("ou", style: TextStyle(color: AppColor.textColor)),
              //     Expanded(
              //       child: Container(
              //           margin: const EdgeInsets.only(left: 25.0),
              //           child: const Divider(
              //             color: AppColor.secondaryColor,
              //             height: 36,
              //           )),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Username",
                controller: usernameInputController,
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.emailAddress,
                labelText: "Email",
                controller: emailInputController,
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Senha",
                controller: passwordInputController,
                passwordField: true,
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Confirme sua Senha",
                controller: confirmPasswordInputController,
                passwordField: true,
              ),
              const SizedBox(
                height: 60,
              ),
              CheckboxListTile(
                title: const Text(
                  "Aceito os termos de uso",
                  style: TextStyle(color: AppColor.textColor),
                ),
                value: termsCheckbox,
                onChanged: (value) {
                  setState(() {
                    termsCheckbox = !termsCheckbox;
                  });
                },
                activeColor: AppColor.accentColor,
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _validarForm,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      foregroundColor: AppColor.textColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.only(
                          left: 70, right: 70, top: 20, bottom: 20)),
                  child: const Text("CRIAR UMA CONTA")),
            ],
          ),
        ),
      ),
    );
  }
}
