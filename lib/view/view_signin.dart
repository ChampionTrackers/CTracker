import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ctracker/widget/oauth.dart';

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

  // bool firstvalue = false; //Valor iniciado na checkbox

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
                "Cadastre-se no\n Champions Tracker\n",
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
              imagePath: 'assets/images/discordlogo.png', //OAuth Discord
              borderColor: Color.fromRGBO(88, 101, 242, 1), 
              containerColor: Color.fromRGBO(88, 101, 242, 1), 
            ),
              SizedBox(width: 35),
                          OAuth( 
              imagePath: 'assets/images/twitterlogo.png', //OAuth Twitter
              borderColor: Color.fromRGBO(29, 161, 242, 1), 
              containerColor: Color.fromRGBO(29, 161, 242, 20), 
            ),
              SizedBox(width: 35),
                          OAuth( 
              imagePath: 'assets/images/googlelogo.png', //OAuth Google
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
                keyboardType: TextInputType.text,
                labelText: "Username",
                controller: usernameInputController,
                hintText: "ChampionMaster",
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.emailAddress,
                labelText: "Email",
                controller: emailInputController,
                hintText: "champion@email.com",
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Senha",
                controller: passwordInputController,
                hintText: "Digite sua senha",
                passwordField: true,
              ),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                keyboardType: TextInputType.text,
                labelText: "Confirme sua Senha",
                controller: confirmPasswordInputController,
                hintText: "Digite a sua senha novamente",
                passwordField: true,
              ),
              const SizedBox(
                height: 40,
              ),

            //checkbox centralizado 

              //  Row(  
              //     mainAxisAlignment: MainAxisAlignment.center,
              //    children: [
              //      Checkbox(value: firstvalue,
              //      activeColor: AppColor.accentColor,
              //       onChanged: (value) {
              //          setState(() {
              //            firstvalue = value!;
              //          });
              //       }),
                   
              //       const Text(
              //        "Aceito os termos de uso",
              //       style: TextStyle(
              //        color: AppColor.textColor,
              //         ),
              //       )
              //    ],
              // ),
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
                  const SizedBox(
                height: 20,
              ),
               const Center(
          child: Text(
            'Já tenho uma conta',
            style: TextStyle(
              fontSize: 11,
              color: AppColor.accentColor)
              )),
            ],
          ),
        ),
      ),
    );
  }
}
