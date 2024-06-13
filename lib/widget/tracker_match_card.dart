import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/view/view_guess.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrackerMatchCard extends StatelessWidget {
  const TrackerMatchCard({
    super.key,
    required this.context,
    required this.teamAName,
    required this.teamBName,
    required this.teamAScore,
    required this.teamBScore,
    required this.teamAImageUrl,
    required this.teamBImageUrl,
    required this.startDate,
    required this.matchId,
    required this.teamAId,
    required this.teamBId,
  });

  final BuildContext context;
  final String teamAName;
  final String teamBName;
  final String teamAScore;
  final String teamBScore;
  final String teamAImageUrl;
  final String teamBImageUrl;
  final DateTime startDate;
  final int matchId;
  final int teamAId;
  final int teamBId;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('d \'de\' MMMM, yyyy', 'pt_BR').format(startDate);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewGuess(
              teamAName: teamAName,
              teamBName: teamBName,
              teamAImageUrl: teamAImageUrl,
              teamBImageUrl: teamBImageUrl,
              matchId: matchId,
              teamAId: teamAId,
              teamBId: teamBId,
              plannedStartDate: startDate,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(10),
        width: 340,
        decoration: BoxDecoration(
          color: AppColor.tertiaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(teamAImageUrl),
                        backgroundColor: AppColor.primaryColor,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        width: 80, // Defina uma largura apropriada
                        child: Text(
                          teamAName,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(teamBImageUrl),
                        backgroundColor: AppColor.primaryColor,
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.center,
                        width: 80, // Defina uma largura apropriada
                        child: Text(
                          teamBName,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                    teamAScore,
                    style: const TextStyle(
                      color: AppColor.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    ':',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    teamBScore,
                    style: const TextStyle(
                      color: AppColor.textColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(
                formattedDate,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.textColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
