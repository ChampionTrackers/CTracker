import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/controller/controller_view_more_tournaments.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:ctracker/view/view_tournament_description.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_card.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewMoreTournaments extends StatefulWidget {
  const ViewMoreTournaments({super.key});

  @override
  State<ViewMoreTournaments> createState() => _ViewMoreTournamentsState();
}

class _ViewMoreTournamentsState extends State<ViewMoreTournaments> {
  late Future<List<Tournament>> futureTournaments;
  final controller = MoreTournamentsController();
  int currentPage = 0;
  bool isNextPageAvailable = true;

  @override
  void initState() {
    super.initState();
    futureTournaments = controller.fetchTournament(currentPage);
  }

  void _loadNextPage() async {
    final nextPageTournaments =
        await controller.fetchTournament(currentPage + 1);
    if (nextPageTournaments.isEmpty) {
      setState(() {
        isNextPageAvailable = false;
      });
    } else {
      setState(() {
        currentPage++;
        futureTournaments = Future.value(nextPageTournaments);
        isNextPageAvailable = true;
      });
    }
  }

  void _loadPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        futureTournaments = controller.fetchTournament(currentPage);
        isNextPageAvailable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackerAppBar(),
      endDrawer: const TrackerDrawer(),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: AppColor.secondAccentColor,
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: FutureBuilder(
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 60, right: 60), // Ajusta a largura do card
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final championship = snapshot.data![index];
                        return TrackerCard(
                          imagePath: championship.picture!,
                          title: championship.name!,
                          game: championship.game!,
                          tournamentType: championship.type!,
                          date: championship.createdAt!,
                          participants: championship.teamsAmount.toString(),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewTournament(
                                        tournamentId:
                                            snapshot.data![index].id!)));
                          },
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _loadPreviousPage,
                      color:
                          currentPage == 0 ? Colors.grey : AppColor.textColor,
                    ),
                    Text(
                      'Page ${currentPage + 1}',
                      style: const TextStyle(color: AppColor.textColor),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: isNextPageAvailable ? _loadNextPage : null,
                      color: isNextPageAvailable
                          ? AppColor.textColor
                          : Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            );
          }
        }),
      ),
    );
  }
}
