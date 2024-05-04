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
                  padding: const EdgeInsets.all(10.0),
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
                          color: AppColor.accentColor,
                          indent: 20,
                          endIndent: 20,
                        ),
                        _buildGuessRow(
                            teamName: "Death Lock",
                            championshipName: "Jogo da Velha",
                            coins: 15),
                        const Divider(
                          color: AppColor.accentColor,
                          indent: 20,
                          endIndent: 20,
                        ),
                        _buildGuessRow(
                            teamName: "Equipe Foguete",
                            championshipName: "Bolinha de Gude Ultimate",
                            coins: 7),
                        const Divider(
                          color: AppColor.accentColor,
                          indent: 20,
                          endIndent: 20,
                        ),
                        _buildGuessRow(
                            teamName: "Destroyers2000",
                            championshipName: "Worms W.M.D. Championship",
                            coins: 15),
                      ],
                    ),
                  ),
                ),
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
