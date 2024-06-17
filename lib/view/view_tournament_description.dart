import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_tournament.dart';
import 'package:ctracker/model/match_model.dart';
import 'package:ctracker/model/team_model.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:ctracker/widget/tracker_match_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class ViewTournament extends StatefulWidget {
  final int tournamentId;

  const ViewTournament({super.key, required this.tournamentId});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Informações'),
    Tab(text: 'Partidas'),
    Tab(text: 'Posições'),
  ];

  @override
  State<ViewTournament> createState() => _ViewTournamentState();
}

class _ViewTournamentState extends State<ViewTournament> {
  late Future<Tournament> futureTournament;
  late Future<List<Team>> futureTeams;
  late Future<List<Match>> futureMatches;
  TournamentController controller = TournamentController();

  @override
  void initState() {
    futureTournament = controller.fetchTournamentDetails(widget.tournamentId);
    futureTeams = controller.fetchTeams(widget.tournamentId);
    futureMatches = controller.fetchMatches(widget.tournamentId);
    initializeDateFormatting('pt_BR', null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureTournament,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar campeonato',
                style: TextStyle(color: AppColor.textColor)),
          );
        } else {
          return DefaultTabController(
            length: ViewTournament.myTabs.length,
            child: Scaffold(
              backgroundColor: AppColor.backgroundColor,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(280),
                child: AppBar(
                  backgroundColor: AppColor.tertiaryColor,
                  flexibleSpace: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data?.picture ??
                                'https://placehold.co/600x400?text=No+Image'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                snapshot.data?.name ?? 'Sem nome',
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: const TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                              .data?.owner?.picture ??
                                          'https://placehold.co/600x400?text=No+Image'),
                                      backgroundColor: AppColor.secondaryColor),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Organizado por',
                                          style: TextStyle(
                                              color: AppColor.textColor,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          snapshot.data?.owner?.nickname ??
                                              'Sem nome',
                                          style: const TextStyle(
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
                        unselectedLabelColor:
                            Color.fromARGB(113, 239, 239, 239),
                        labelColor: AppColor.textColor,
                        indicatorColor: AppColor.secondAccentColor,
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        tabs: ViewTournament.myTabs,
                        dividerColor: AppColor.tertiaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: ViewTournament.myTabs.map((Tab tab) {
                  if (tab.text == 'Informações') {
                    return buildInformacoesContent(snapshot.data!);
                  } else if (tab.text == 'Partidas') {
                    return buildPartidasContent();
                  } else {
                    return buildPosicoesContent(snapshot.data!);
                  }
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildInformacoesContent(Tournament data) {
    final championship = data;

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
            Text(
              championship.description ?? 'Sem descrição',
              style: const TextStyle(color: AppColor.textColor, fontSize: 16),
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Equipes participando: ',
                          style: TextStyle(
                              color: AppColor.textColor, fontSize: 16),
                        ),
                        Text(
                          championship.teamsAmount.toString(),
                          style: const TextStyle(
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
              padding: const EdgeInsets.all(10),
              width: 900,
              height: 150,
              decoration: BoxDecoration(
                color: AppColor.tertiaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: FutureBuilder(
                  future: futureTeams,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Erro ao carregar equipes',
                            style: TextStyle(color: AppColor.textColor)),
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data![index].picture ??
                                    'https://placehold.co/600x400?text=No+Image',
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
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

  Widget buildPartidasContent() {
    return FutureBuilder(
      future: futureMatches,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar partidas',
                style: TextStyle(color: AppColor.textColor)),
          );
        } else {
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
                  ...snapshot.data!.map((match) => TrackerMatchCard(
                        context: context,
                        teamAName: match.homeTeam.name,
                        teamBName: match.awayTeam.name,
                        teamAScore: match.homeTeam.score.toString(),
                        teamBScore: match.awayTeam.score.toString(),
                        teamAImageUrl: match.homeTeam.picture,
                        teamBImageUrl: match.awayTeam.picture,
                        startDate: match.plannedStartTime,
                        matchId: match.id,
                        teamAId: match.homeTeam.id,
                        teamBId: match.awayTeam.id,
                      )),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildPosicoesContent(Tournament data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
              },
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
