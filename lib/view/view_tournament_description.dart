import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class ViewTournament extends StatelessWidget {
  const ViewTournament({super.key});

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
                          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Text(
                            'Sword Fighters',
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Icon(Icons.person,
                                    color: Colors.white),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Organizado por',
                                      style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Fenix',
                                      style: TextStyle(
                                          color: AppColor.accentColor,
                                          fontSize: 16),
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
                  const TabBar(
                    unselectedLabelColor: Color.fromARGB(113, 239, 239, 239),
                    labelColor: AppColor.textColor,
                    indicatorColor: AppColor.secondAccentColor,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    tabs: myTabs,
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              if (tab.text == 'Informações') {
                return buildInformacoesContent();
              } else if (tab.text == 'Histórico') {
                return buildHistoricoContent();
              } else {
                final String label = tab.text!.toLowerCase();
                return Center(
                  child: Text(
                    'This is the $label tab',
                    style: const TextStyle(fontSize: 32),
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
            padding: const EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Regras do Campeonato',
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet est ut et consequat nonumy dolor et accusam justo dolor. Sea justo dignissim justo nonumy duo diam praesent diam rebum amet et dolor vel aliquyam ',
                    style: TextStyle(color: AppColor.textColor, fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Informações',
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  // Informações
                  Container(
                    margin: const EdgeInsets.all(0.1),
                    decoration: BoxDecoration(
                      color: AppColor.tertiaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.tertiaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Equipes participando: ',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Palpitadores: ',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                              Text(
                                '16',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Fechamento dos palpites: ',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                              Text(
                                '13/07/2024',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Palpitador com mais pontos: ',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                              Text(
                                'Kleberson',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Melhor jogador: ',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                              Text(
                                'Giovanne',
                                style: TextStyle(
                                    color: AppColor.textColor, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(children: [
                        Container(
                            margin: const EdgeInsets.only(top: 0, bottom: 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: const Row(
                                          //Linha
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Text(
                                                "Equipes Inscritas",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.textColor,
                                                ),
                                              ),
                                            ),
                                          ])),
                                ]))
                      ])),

                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 900,
                    height: 70,
                    decoration: BoxDecoration(
                      color: AppColor.tertiaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Wrap(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Acompanhe o campeonato aqui',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 200, // Altura do mapa
                          decoration: BoxDecoration(
                            color: AppColor.tertiaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
  }

  Widget buildHistoricoContent() {
    return const Center();
  }
}
