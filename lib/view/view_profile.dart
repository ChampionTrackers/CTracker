import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Container( // foto perfil
                height: 200,
                width:200,
                margin: const EdgeInsets.only(top:40 , bottom: 20),
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor, // Cor de fundo do Container
                  borderRadius: BorderRadius.circular(100), // Raio de borda de 10 pixels
                ),
              ),

              const Text("[Nome]",
                  style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor
                  )),

              Container(  // Header de atividade
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  height: 45,
                  width: 800,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( //Linha
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                "ATIVIDADE",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(450, 10, 0, 0), // Espaço entre os textos
                              child: Text(
                                "Codigo ❐",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondAccentColor,
                                ),
                              ),
                            )],
                        ),
                      ])),

              Container(  // Conteudo das Atividades
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row( //Linha1
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 0, 10, 20),
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
                          padding: EdgeInsets.fromLTRB(180, 0, 10, 20), // Espaço entre os textos
                          child: Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha2
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                          child: Text(
                            "Melhor Desempenho:",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha3
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                          child: Text(
                            "Melhor Palpite:",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(200, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha4
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                          child: Text(
                            "Torneios Participados:",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(140, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha5
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(80, 0, 10, 0),
                          child: Text(
                            "Palpites Corretos:",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(179, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                  ],
                ),
              ),

              Container(  // Header de Historico
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  height: 45,
                  width: 800,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( //Linha
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                              padding: EdgeInsets.fromLTRB(440, 10, 0, 0), // Espaço entre os textos
                              child: Text(
                                "Ver Mais +",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondAccentColor,
                                ),
                              ),
                            )],
                        ),
                      ])),

              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 50),// Conteudo das Historico
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row( //Linha1
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(300, 0, 10, 0), // Espaço entre os textos
                          child: Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha2
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(300, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha3
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(300, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha4
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(300, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                    Row( //Linha5
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 10, 0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.textColor,
                            ),
                          ),
                        ),
                        // Espaço entre os textos
                        Padding(
                          padding: EdgeInsets.fromLTRB(300, 0, 10, 0),
                          child:Text(
                            "Placeholder",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        )],
                    ),

                  ],
                ),
              ),


              Container(  // Header de Amigos
                  margin: const EdgeInsets.only(top:0, bottom: 20),
                  height: 45,
                  width: 800,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row( //Linha
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                              padding: EdgeInsets.fromLTRB(440, 10, 0, 0), // Espaço entre os textos
                              child: Text(
                                "Ver Mais +",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.secondAccentColor,
                                ),
                              ),
                            )],
                        ),
                      ])
              ),

              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                width: 800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container( //amigo1
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100), // Adiciona borda arredondada ao Container
                          ),
                        ),
                        const SizedBox(width: 15), // Espaço entre os Containers

                        Container( //amigo2
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100), // Adiciona borda arredondada ao Container
                          ),
                        ),
                        const SizedBox(width: 15), // Espaço entre os Containers

                        Container(//amigo3
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100), // Adiciona borda arredondada ao Container
                          ),
                        ),
                        const SizedBox(width: 15), // Espaço entre os Containers

                        Container( //amigo4
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100), // Adiciona borda arredondada ao Container
                          ),
                        ),
                        const SizedBox(width: 15), // Espaço entre os Containers

                        Container( //amigo5
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(100), // Adiciona borda arredondada ao Container
                          ),
                        ),

                      ],
                    ),
                    // Adicione mais linhas de Containers conforme necessário
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}