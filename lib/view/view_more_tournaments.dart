import 'package:ctracker/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewCards extends StatefulWidget {
  const ViewCards({Key? key}) : super(key: key);

  @override
  State<ViewCards> createState() => _ViewCardsState();
}

class _ViewCardsState extends State<ViewCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              SizedBox(
                width: 270,
                height: 305,
                child: Card(
                  elevation: 5,
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 2),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/csgo.jpg',
                          width: 220,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'STRIKE DA BOA',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),                   
                     const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 8),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.gamepad,
                                color: AppColor.secondaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 7), //Espaçamento do icone a borda
                              Text(
                                'Counter-Strike:GO',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),                  
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7),
                          Row(
                            children: [
                              FaIcon(
                                Icons.desktop_mac_sharp,
                                color: AppColor.secondaryColor,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Virtual',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.user,
                                color: AppColor.secondaryColor,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '24 Participantes',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                color: AppColor.secondaryColor,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '01/07/2024',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),              
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Segundo card

              SizedBox(
                width: 270,
                height: 305,
                child: Card(
                  elevation: 5,
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 2),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/lol.png',
                          width: 220,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Champions\' League',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 8),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.gamepad,
                                color: AppColor.secondaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 7), //Espaçamento do icone a borda
                              Text(
                                'League of Legends',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),                  
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7),
                          Row(
                            children: [
                              Icon(
                                Icons.desktop_mac_sharp,
                                color: AppColor.secondaryColor,                               
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Virtual',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 7),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.users,
                                color: AppColor.secondaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '76 Participantes',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 11),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.calendar,
                                color: AppColor.secondaryColor,
                                size: 20,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '20/08/2024',
                                style: TextStyle(color: AppColor.textColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
