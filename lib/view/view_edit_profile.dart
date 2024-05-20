import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_edit_profile.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:ctracker/widget/form_text_field.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewEditProfile extends StatefulWidget {
  const ViewEditProfile({super.key});

  @override
  State<ViewEditProfile> createState() => _ViewEditProfileState();
}

class _ViewEditProfileState extends State<ViewEditProfile> {
  final nameInputController = TextEditingController();
  final nicknameInputController = TextEditingController();
  final emailInputController = TextEditingController();
  final confirmUpdatePasswordInputController = TextEditingController();
  final newPasswordInputController = TextEditingController();
  final confirmNewPasswordInputController = TextEditingController();
  final oldPasswordInputController = TextEditingController();

  late EditProfileController _editProfileController;

  late Future<User> userModel;

  @override
  void initState() {
    super.initState();
    _editProfileController = EditProfileController();
    userModel = _editProfileController.fetchInfo();
  }

  @override
  void dispose() {
    nameInputController.dispose();
    nicknameInputController.dispose();
    emailInputController.dispose();
    confirmUpdatePasswordInputController.dispose();
    newPasswordInputController.dispose();
    confirmNewPasswordInputController.dispose();
    oldPasswordInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      endDrawer: const TrackerDrawer(),
      body: FutureBuilder<User>(
          future: userModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Erro: ${snapshot.error}",
                    style: const TextStyle(color: AppColor.textColor)),
              );
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              nameInputController.text = user.name!;
              nicknameInputController.text = user.nickname!;
              emailInputController.text = user.email!;

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      "Editar Perfil",
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Nome",
                      controller: nameInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Username",
                      controller: nicknameInputController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Email",
                      controller: emailInputController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Digite sua senha para confirmar as alterações",
                      style: TextStyle(color: AppColor.textColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Senha",
                      controller: confirmUpdatePasswordInputController,
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColor.primaryColor,
                        ),
                        child: const Text(
                          "CONFIRMAR",
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w600),
                        )),
                    const Divider(
                      color: AppColor.secondaryColor,
                      height: 50,
                    ),
                    const Text(
                      "Trocar a Senha",
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Senha Atual",
                      controller: newPasswordInputController,
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Nova Senha",
                      controller: newPasswordInputController,
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FormTextField(
                      labelText: "Confirmar Nova Senha",
                      controller: confirmNewPasswordInputController,
                      passwordField: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColor.primaryColor,
                        ),
                        child: const Text(
                          "TROCAR",
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),
              );
            } else {
              return const Center(
                  child: Text('Dados indisponíveis',
                      style: TextStyle(color: AppColor.textColor)));
            }
          }),
    );
  }
}
