import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_home.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:ctracker/view/view_more_tournaments.dart';
import 'package:ctracker/view/view_tournament_description.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

import '../widget/tracker_card.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({super.key});

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  late Future<List<Tournament>> futureTournaments;
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    futureTournaments = controller.fetchTournament();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Torneios Públicos',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textColor,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ViewMoreTournaments()));
                      },
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
            ),
            FutureBuilder(
                future: futureTournaments,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Erro ao carregar torneios',
                            style: TextStyle(color: AppColor.textColor)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Nenhum torneio encontrado',
                            style: TextStyle(color: AppColor.textColor)));
                  } else {
                    return SizedBox(
                        height: 300,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: 20), // Margem à esquerda
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final championship = snapshot.data![index];
                              return TrackerCard(
                                imagePath: championship.picture!,
                                title: championship.name!,
                                game: championship.game!,
                                tournamentType: championship.type!,
                                date: championship.createdAt!,
                                participants:
                                    championship.teamsAmount.toString(),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewTournament(
                                              tournamentId:
                                                  snapshot.data![index].id!)));
                                },
                              );
                            }));
                  }
                })),
            const SizedBox(height: 60),
            // const MyTable(),
          ],
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Seus Jogos',
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          Table(
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.primaryColor,
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
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.primaryColor,
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
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: AppColor.tertiaryColor,
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.monitor,
                            color: AppColor.textColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: AppColor.tertiaryColor,
                      alignment: Alignment.center,
                      child: const Text(
                        'Pro League Free Fire',
                        style: TextStyle(color: AppColor.textColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
