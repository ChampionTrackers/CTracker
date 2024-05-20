import 'package:flutter/material.dart';
import 'package:ctracker/constants/colors.dart';

class ViewTournament extends StatelessWidget {
  const ViewTournament({Key? key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Informações'),
    Tab(text: 'Partidas'),
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
            preferredSize: const Size.fromHeight(300),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            'Sword Fighters',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColor.secondaryColor,
                                  child: Text('GT')),
                              Padding(
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
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              } else if (tab.text == 'Partidas') {
                return buildPartidasContent();
              } else {
                return buildPosicoesContent();
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
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: const Row(
                                    //Linha
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                        child: const CircleAvatar(
                            radius: 22.0,
                            backgroundColor: AppColor.secondaryColor,
                            child: Text('GC')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const CircleAvatar(
                            radius: 22.0,
                            backgroundColor: AppColor.secondaryColor,
                            child: Text('EH')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const CircleAvatar(
                            radius: 22.0,
                            backgroundColor: AppColor.secondaryColor,
                            child: Text('TL')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const CircleAvatar(
                            radius: 22.0,
                            backgroundColor: AppColor.secondaryColor,
                            child: Text('FV')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: const CircleAvatar(
                            radius: 22.0,
                            backgroundColor: AppColor.secondaryColor,
                            child: Text('NC')),
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
          ],
        ),
      ),
    );
  }

// Gerando partidas atuais e antigas
  Widget buildPartidasContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Partidas atuais',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(1, (index) => buildPartidasAtuaisBox()),
            const SizedBox(height: 20),
            const Text(
              'Partidas antigas',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...List.generate(
                2,
                (index) =>
                    buildPartidasAntigasBox()), // Gerando partidas antigas
          ],
        ),
      ),
    );
  }

  Widget buildPartidasAtuaisBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(10),
      width: 340,
      decoration: BoxDecoration(
        color: AppColor.tertiaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Team A',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Team B',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '5',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  ': 0',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Text(
              '13/07/2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildPartidasAntigasBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: 340,
      decoration: BoxDecoration(
        color: AppColor.tertiaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Team C',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColor.primaryColor,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Team D',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  ': 8',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Text(
              '10/07/2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildPosicoesContent() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Posição',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: const Text(
                        'Equipe',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: const Text(
                        'VDE',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: 15), // Espaçamento entre as linhas
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ],
              ),
              buildTableRow('1°', 'The Mystics', '3.5'),
              const TableRow(
                children: [
                  SizedBox(height: 15), // Espaçamento entre as linhas
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ],
              ),
              buildTableRow('2°', 'The Dogs', '3.5'),
              const TableRow(
                children: [
                  SizedBox(height: 15), // Espaçamento entre as linhas
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ],
              ),
              buildTableRow('3°', 'The Sailors', '3.5'),
              const TableRow(
                children: [
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ],
              ),
              buildTableRow('4°', 'Loren Ipsum', '3.5'),
            ],
          ),
        ],
      ),
    ),
  );
}

TableRow buildTableRow(String position, String team, String score) {
  return TableRow(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: AppColor.tertiaryColor // Cor de fundo para as linhas da tabela
    ),
    children: [
      TableCell(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            position,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            team,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            score,
            style: const TextStyle(
              color: AppColor.textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ],
  );
}
}
