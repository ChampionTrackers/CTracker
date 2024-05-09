import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Informações'),
    Tab(text: 'Histórico'),
    Tab(text: 'Posições'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(303),
            child: AppBar(
              backgroundColor: AppColor.tertiaryColor,
              flexibleSpace: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 150,
                    // Altura da imagem
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sword.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                          child: Text(
                            'Sword Fighters', // Título abaixo das informações
                            style: TextStyle(color: AppColor.textColor, fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.person, color: Colors.white), // Ícone de usuário
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Organizado por', // Subtítulo abaixo do título
                                    style: TextStyle(color: AppColor.textColor, fontSize: 16),
                                  ),
                                  Text(
                                    'Fenix', // Subtítulo abaixo do título
                                    style: TextStyle(color: AppColor.accentColor, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const TabBar(
                    unselectedLabelColor: AppColor.textColor,
                    labelColor: AppColor.textColor,
                    indicatorColor: AppColor.secondAccentColor,
                    tabs: myTabs,
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              // Conteudo da tela de Informações
              if (tab.text == 'Informações') {
                return buildInformacoesContent();
              }
              // Conteudo da tela de Histórico
              else if (tab.text == 'Histórico') {
                return buildHistoricoContent();
              }
              // Conteudo da tela de Posições
              else {
                final String label = tab.text!.toLowerCase();
                return Center(
                  child: Text(
                    'This is the $label tab',
                    style: const TextStyle(fontSize: 36),
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildInformacoesContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Regras do Campeonato',
              style: TextStyle(color: AppColor.textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lorem ipsum dolor sit amet est ut et consequat nonumy dolor et accusam justo dolor. Sea justo dignissim justo nonumy duo diam praesent diam rebum amet et dolor vel aliquyam ',
              style: TextStyle(color: AppColor.textColor, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Informações', // Texto da descrição
              style: TextStyle(color: AppColor.textColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8), // Espaçamento entre o texto e os cards
            Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: AppColor.tertiaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Equipes participando: 10',
                      style: TextStyle(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      'Palpitadores: 12',
                      style: TextStyle(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      'Fechamento dos palpites: 13/07/2024',
                      style: TextStyle(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      'Palpitador com mais pontos: Kleberson',
                      style: TextStyle(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      'Melhor jogador: Giovanne',
                      style: TextStyle(color: AppColor.textColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16), // Espaçamento entre o campo de imagem e os amigos
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    // Adicionando a Box Decoration aos amigos
                    margin: const EdgeInsets.only(top: 0, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: const Row(
                            //Linha
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Text(
                                  "AMIGOS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.textColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0), // Espaço entre os textos
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Wrap(
                            children: [
                              Container(
                                //amigo1
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ), // Adiciona borda arredondada ao Container
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ), // Espaço entre os Containers
                              Container(
                                //amigo2
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ), // Adiciona borda arredondada ao Container
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ), // Espaço entre os Containers
                              Container(
                                //amigo3
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ), // Adiciona borda arredondada ao Container
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ), // Espaço entre os Containers
                              Container(
                                //amigo4
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ), // Adiciona borda arredondada ao Container
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ), // Espaço entre os Containers
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHistoricoContent() {
    return const Center();
  }
}
