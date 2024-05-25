import 'package:ctracker/constants/colors.dart';
import 'package:ctracker/widget/bottom_navigation.dart';
import 'package:ctracker/widget/tracker_appbar.dart';
import 'package:ctracker/widget/tracker_drawer.dart';
import 'package:flutter/material.dart';

class ViewCard extends StatelessWidget {
  const ViewCard({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                  left: 50, right: 50), // Ajusta a largura do card
              children: [
                _buildCard(
                  'assets/images/CSGO.jpg',
                  'Counter-Strike: GO',
                ),
                _buildCard(
                  'assets/images/Sword.png',
                  'Sword Fighting',
                ),
                _buildCard(
                  'assets/images/TFT.jpg',
                  'Teamfight Tactics',
                ),
                _buildCard(
                  'assets/images/lol.png',
                  'Champions\' League',
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildCard(
    String imagePath,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          8.0, 8.0, 8.0, 0), // Adicionando margem apenas na parte superior
      child: SizedBox(
        height: 280,
        child: Card(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          color: const Color.fromRGBO(46, 56, 86, 1),
          child: SizedBox(
            height: 280, // Altura desejada para o cartão
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 100,
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          title,
                          style: const TextStyle(
                            color: AppColor.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.gamepad, color: AppColor.textColor),
                            SizedBox(width: 5),
                            Text('CS:GO',
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.location_on, color: AppColor.textColor),
                            SizedBox(width: 5),
                            Text('Virtual',
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: AppColor.textColor),
                            SizedBox(width: 5),
                            Text('Data: 10/05/2024',
                                style: TextStyle(color: AppColor.textColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Icon(Icons.people, color: AppColor.textColor),
                            SizedBox(width: 5),
                            Text('Participantes: 10',
                                style: TextStyle(color: AppColor.textColor)),
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
