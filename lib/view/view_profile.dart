import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_profile.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  late ProfileController _profileController;

  late Future<User> userModel;

  @override
  void initState() {
    super.initState();
    _profileController = ProfileController();

    userModel = _profileController.fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      endDrawer: const TrackerDrawer(),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColor.secondAccentColor,
          child: const Icon(Icons.search)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: FutureBuilder(
          future: userModel,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Erro ao carregar perfil: ${snapshot.error}",
                    style: const TextStyle(color: AppColor.textColor)),
              );
            } else if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRect(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40, bottom: 20),
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            color: AppColor.tertiaryColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.network(
                            snapshot.data!.picture ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(snapshot.data?.name ?? "Erro",
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColor.textColor)),
                      Container(
                          // Header de atividade
                          margin: const EdgeInsets.only(top: 40, bottom: 20),
                          height: 45,
                          width: 800,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: const Row(
                                    //Linha
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ATIVIDADE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.textColor,
                                        ),
                                      ),
                                      Text(
                                        "Codigo ❐",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.secondAccentColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ])),
                      Container(
                        // Conteudo das Atividades
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Row(
                                //Linha1
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                                    child: Text(
                                      "SCORE TOTAL",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 10, 20), // Espaço entre os textos
                                    child: Text(
                                      snapshot.data?.score.toString() ?? "Erro",
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha2
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Melhor Desempenho:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha3
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Melhor Palpite:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha4
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Torneios Participados:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha5
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Palpites Corretos:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          // Header de Historico
                          margin: const EdgeInsets.only(top: 0, bottom: 20),
                          height: 45,
                          width: 800,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: const Row(
                                    //Linha
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "HISTORICO",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.textColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(10, 0, 0,
                                            0), // Espaço entre os textos
                                        child: Text(
                                          "Ver Mais +",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.secondAccentColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ])),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 50), // Conteudo das Historico
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha1
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0, 0, 10, 0), // Espaço entre os textos
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha2
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha3
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha4
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: const Row(
                                //Linha5
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.textColor,
                                      ),
                                    ),
                                  ),
                                  // Espaço entre os textos
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      "Placeholder",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.secondaryColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          // Header de Amigos
                          margin: const EdgeInsets.only(top: 0, bottom: 20),
                          height: 45,
                          width: 800,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: const Row(
                                    //Linha
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Text(
                                          "AMIGOS",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.textColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 10, 0,
                                            0), // Espaço entre os textos
                                        child: Text(
                                          "Ver Mais +",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.secondAccentColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ])),
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        width: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Wrap(
                                children: [
                                  Container(
                                    //amigo1
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          100), // Adiciona borda arredondada ao Container
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 10), // Espaço entre os Containers

                                  Container(
                                    //amigo2
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          100), // Adiciona borda arredondada ao Container
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 10), // Espaço entre os Containers

                                  Container(
                                    //amigo3
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          100), // Adiciona borda arredondada ao Container
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 10), // Espaço entre os Containers

                                  Container(
                                    //amigo3
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(
                                          100), // Adiciona borda arredondada ao Container
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 10), // Espaço entre os Containers
                                ],
                              ),
                            ),
                            // Adicione mais linhas de Containers conforme necessário
                          ],
                        ),
                      ),
                    ]),
              );
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }),
    );
  }
}
