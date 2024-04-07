import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ctracker/components/oauth.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({super.key});

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();

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
                "Logar-se\n no Champions Tracker\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor),
              ),
               const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                          OAuth( 
              imagePath: 'lib/images/discordlogo.png', //OAuth Discord
              borderColor: Color.fromRGBO(88, 101, 242, 1), 
              containerColor: Color.fromRGBO(88, 101, 242, 1), 
            ),
              SizedBox(width: 35),
                          OAuth( 
              imagePath: 'lib/images/twitterlogo.png', //OAuth Twitter
              borderColor: Color.fromRGBO(29, 161, 242, 1), 
              containerColor: Color.fromRGBO(29, 161, 242, 20), 
            ),
              SizedBox(width: 35),
                          OAuth( 
              imagePath: 'lib/images/googlelogo.png', //OAuth Google
              borderColor: Colors.white, 
              containerColor: Colors.white, 
            ), 
                ]
               ),
               const SizedBox(height: 25),
               Row(
                 children: <Widget>[
                   Expanded(
                     child: Container(
                         margin: const EdgeInsets.only(right: 25.0),
                         child: const Divider(
                           color: AppColor.secondaryColor,
                           height: 36,
                         )),
                   ),
                   const Text("ou", style: TextStyle(color: AppColor.textColor)),
                   Expanded(
                    child: Container(
                         margin: const EdgeInsets.only(left: 25.0),
                         child: const Divider(
                           color: AppColor.secondaryColor,
                           height: 36,
                         )),
                   ),
                 ],
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
              ElevatedButton(
                  onPressed: _validarForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.textColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20)
                  ),
                  child: const Text("LOGAR")),
            ],
          ),
        ),
      ),
    );
  }
}
