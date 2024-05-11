import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewFeed extends StatelessWidget {
  const ViewFeed({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Seus Palpites",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor,
                  )),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.tertiaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 160,
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        _buildGuessRow(
                            teamName: "Blue Tigers",
                            championshipName: "Sword Fighters",
                            coins: 20),
                        const Divider(
                          color: AppColor.accentColor
                        ),
                        _buildGuessRow(
                            teamName: "Death Lock",
                            championshipName: "Jogo da Velha",
                            coins: 15),
                        const Divider(
                          color: AppColor.accentColor
                        ),
                        _buildGuessRow(
                            teamName: "Equipe Foguete",
                            championshipName: "Bolinha de Gude Ultimate",
                            coins: 7),
                        const Divider(
                          color: AppColor.accentColor
                        ),
                        _buildGuessRow(
                            teamName: "Destroyers2000",
                            championshipName: "Worms W.M.D. Championship",
                            coins: 15),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Suas Equipes",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textColor,
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: AppColor.secondAccentColor,
                      ),
                      child: const Text(
                        "VER MAIS",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildTeamCard(
                        teamName: "Equipe Foguete",
                        wins: 3,
                        playerCount: 5,
                        imagePath:
                            "https://picsum.photos/seed/foguete/200/200"),
                    _buildTeamCard(
                        teamName: "Equipe Invejosos",
                        wins: 2,
                        playerCount: 3,
                        imagePath:
                            "https://picsum.photos/seed/invejosos/200/200"),
                    _buildTeamCard(
                        teamName: "Alvejante Plays",
                        wins: 3,
                        playerCount: 5,
                        imagePath:
                            "https://picsum.photos/seed/alvejante/200/200"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Seus Torneios",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textColor,
                  )),
              const SizedBox(height: 20),
              _buildTournamentTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTournamentTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(1),
      },
      children: [
        TableRow(children: [
          TableCell(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              color: const Color.fromARGB(178, 46, 56, 86),
              alignment: Alignment.center,
              child: const Text(
                'TIPO',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              color: const Color.fromARGB(178, 46, 56, 86),
              alignment: Alignment.center,
              child: const Text(
                'NOME DO TORNEIO',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
              padding: const EdgeInsets.all(3.0),
              color: const Color.fromARGB(178, 46, 56, 86),
              alignment: Alignment.center,
              child: const Text(
                'STATUS',
                style: TextStyle(
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
        TableRow(children: [
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.backgroundColor,
              alignment: Alignment.center,
              child: const Icon(
                Icons.monitor,
                color: AppColor.textColor,
                size: 20,
              ),
            )
          ),
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.backgroundColor,
              alignment: Alignment.center,
              child: const Text(
                'Sword Fighters',
                style: TextStyle(
                  color: AppColor.textColor,
                ),
              ),
            )
          ),
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.backgroundColor,
              alignment: Alignment.center,
              child: const Text(
                'ATIVO',
                style: TextStyle(
                  color: AppColor.secondAccentColor,
                ),
              ),
            )
          ),
        ]),
        TableRow(children: [
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.tertiaryColor,
              alignment: Alignment.center,
              child: const Icon(
                Icons.directions_run,
                color: AppColor.textColor,
                size: 20,
              ),
            )
          ),
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.tertiaryColor,
              alignment: Alignment.center,
              child: const Text(
                'Campeões de Maringá',
                style: TextStyle(
                  color: AppColor.textColor,
                ),
              ),
            )
          ),
          TableCell(child: 
            Container(
              padding: const EdgeInsets.all(3.0),
              color: AppColor.tertiaryColor,
              alignment: Alignment.center,
              child: const Text(
                'INATIVO',
                style: TextStyle(
                  color: AppColor.secondAccentColor,
                ),
              ),
            )
          ),
        ]),
      ],
    );
  }

  Widget _buildTeamCard(
      {required String teamName,
      int wins = 0,
      int playerCount = 0,
      required String imagePath}) {
    return Card(
      color: const Color.fromARGB(178, 46, 56, 86),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: 180,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.tertiaryColor,
                backgroundImage: NetworkImage(imagePath),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: teamName,
                        style: const TextStyle(
                            color: AppColor.secondAccentColor,
                            fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text("Vitórias: $wins",
                      style: const TextStyle(
                          color: AppColor.textColor, fontSize: 12)),
                  Text("Jogadores: $playerCount",
                      style: const TextStyle(
                          color: AppColor.textColor, fontSize: 12)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuessRow(
      {required String teamName,
      required String championshipName,
      int coins = 0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.accentColor),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(teamName,
                      style: const TextStyle(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  Text(championshipName,
                      style: const TextStyle(
                          color: AppColor.textColor, fontSize: 12))
                ],
              ),
            ],
          ),
          RichText(
              text: TextSpan(
            text: '$coins ',
            children: const <TextSpan>[
              TextSpan(
                  text: "CTCoins",
                  style: TextStyle(
                      color: AppColor.secondaryColor,
                      fontWeight: FontWeight.normal))
            ],
            style: const TextStyle(
                color: AppColor.secondAccentColor, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
