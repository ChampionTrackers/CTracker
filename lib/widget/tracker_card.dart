import 'package:ctracker/constants/colors.dart';
import 'package:flutter/material.dart';

class TrackerCard extends StatelessWidget {
  const TrackerCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.game,
    required this.tournamentType,
    required this.date,
    required this.participants,
    required this.onTap,
  });

  final String imagePath;
  final String title;

  final String game;
  final String tournamentType;
  final String date;
  final String participants;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            8.0, 8.0, 8.0, 0), // Adicionando margem apenas na parte superior
        child: Card(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          color: AppColor.tertiaryColor,
          child: SizedBox(
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 100,
                  width: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                              color: AppColor.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.gamepad,
                                color: AppColor.secondaryColor),
                            const SizedBox(width: 5),
                            Text(game,
                                style:
                                    const TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: AppColor.secondaryColor),
                            const SizedBox(width: 5),
                            Text(tournamentType,
                                style:
                                    const TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: AppColor.secondaryColor),
                            const SizedBox(width: 5),
                            Text('Data: $date',
                                style:
                                    const TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.people,
                                color: AppColor.secondaryColor),
                            const SizedBox(width: 5),
                            Text('Participantes: $participants',
                                style:
                                    const TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
